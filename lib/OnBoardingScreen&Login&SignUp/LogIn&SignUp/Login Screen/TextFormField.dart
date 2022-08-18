import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Button.dart';
import '../../../HomeScreen&Drawer/ZoomDrawer.dart';
import 'Text Field Container.dart';

extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
  bool isWhitespace() => trim().isEmpty;
  bool isValidDouble() => double.tryParse(this) != null;
  bool isValidInt() => int.tryParse(this) != null;
  bool isValidPassword(){
    return RegExp(
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$'
    ).hasMatch(this);
  }
}

class TextFormFieldLogin extends StatefulWidget {

  TextFormFieldLogin({
    Key? key,
  }) : super(key: key,
  );

  @override
  State<TextFormFieldLogin> createState() =>TextFormFieldLoginState();
}
class TextFormFieldLoginState extends State<TextFormFieldLogin> {
  bool obscurePassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final aut = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children :
        [
          TextFieldContainer(
          child: TextFormField(
            validator: (s){
              if (!s!.isValidEmail()) {
                return "Enter a valid email";
              }
            },
            style: GoogleFonts.josefinSans(
              textStyle:TextStyle(
                fontSize: 18,
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.w600,
              ),),
            cursorColor: Color(0xFF6F35A5),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (String value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: 'Email Address',
              labelStyle: GoogleFonts.josefinSans(
                textStyle:TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6F35A5),
                  fontWeight: FontWeight.w600,
                ),),
              hintText: 'Email Address',
              hintStyle: GoogleFonts.josefinSans(
                textStyle:TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6F35A5),
                  fontWeight: FontWeight.w600,
                ),),
              prefixIcon: Icon(
                  color: Color(0xFF6F35A5),
                  Icons.person
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        TextFieldContainer(
          child: TextFormField(
            validator: (s) {
              if (!s!.isValidPassword()) {
                return "This is a required field";
              }
            },
            style: GoogleFonts.josefinSans(
              textStyle:TextStyle(
                fontSize: 18,
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.w600,
              ),),
            cursorColor: Color(0xFF6F35A5),
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            onFieldSubmitted: (String value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: GoogleFonts.josefinSans(
                textStyle:TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6F35A5),
                  fontWeight: FontWeight.w600,
                ),),
              hintText: 'Password',
              hintStyle: GoogleFonts.josefinSans(
                textStyle:TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6F35A5),
                  fontWeight: FontWeight.w600,
                ),),
              prefixIcon: Icon(
                color:  Color(0xFF6F35A5),
                Icons.lock,
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => obscurePassword = !obscurePassword),
                icon: Icon(
                  color: Color(0xFF6F35A5),
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ),
          Button(
              text: 'Login',
              press: () async {
                WidgetsFlutterBinding.ensureInitialized();
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString("email", emailController.text);
                // Get.to(const HomePage());
                final isValid = formKey.currentState!.validate();
                print("Form Is Valid : $isValid");
                if(isValid == true){
                  signIn(emailController.text, passwordController.text);
                }
              }
          ),
      ]
      ),
    );

  }

  void signIn(String email , String password) async {
    if (formKey.currentState!.validate())
    {
      await aut.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        Fluttertoast.showToast(
            msg: "Login Successful",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 20.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ZoomDrawers()));
      }).catchError((error){
        Fluttertoast.showToast(
            msg: error!.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    }
  }
}
