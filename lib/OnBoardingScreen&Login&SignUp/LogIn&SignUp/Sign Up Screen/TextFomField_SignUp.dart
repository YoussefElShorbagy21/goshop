import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Log_In_Screen.dart';

import '../../../HomeScreen&Drawer/ZoomDrawer.dart';
import '../../../models/usermodel.dart';
import '../Login Screen/Button.dart';
import '../Login Screen/Text Field Container.dart';


extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
  bool isWhitespace() => trim().isEmpty;
  bool isValidDouble() => double.tryParse(this) != null;
  bool isValidInt() => int.tryParse(this) != null;
}

class TextFormFieldSignUp extends StatefulWidget {
  const TextFormFieldSignUp({Key? key}) : super(key: key);

  @override
  State<TextFormFieldSignUp> createState() => _TextFormFieldSignUpState();
}

class _TextFormFieldSignUpState extends State<TextFormFieldSignUp> {
  bool obscurePassword = true;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
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
                  if (s!.isEmpty || !RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$').hasMatch(s)) {
                  // if(!s!.isValidEmail()){
                      return "Enter a valid Name";
                  }
                },
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.w600,
                  ),),
                cursorColor: Color(0xFF6F35A5),
                controller: nameController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6F35A5),
                      fontWeight: FontWeight.w600,
                    ),),
                  hintText: 'User Name',
                  hintStyle: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6F35A5),
                      fontWeight: FontWeight.w600,
                    ),),
                  prefixIcon:  Icon(
                      color: Color(0xFF6F35A5),
                      Icons.person
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

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
                  if (s!.isWhitespace()) {
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
                text: 'SignUP' ,
                press: () async{
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString("email", emailController.text);
                  final isValid = formKey.currentState!.validate();
                  print("Form Is Valid : $isValid");
                  if(isValid == true){
                    singUp(emailController.text, passwordController.text );
                  }
                }
            ),
          ]
      ),
    );
  }

  void singUp(String email , String password)  async
  {
    if(formKey.currentState!.validate())
    {
      await aut.createUserWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) {
        postDetailsToFirebase();
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

  postDetailsToFirebase() async
  {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    User? user = aut.currentUser ;
    userModel.email = emailController.text;
    userModel.userid = user!.uid ;
    userModel.name = nameController.text;
    userModel.image = 'https://i.stack.imgur.com/ILTQq.png' ;

    await firestore.collection('users').doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(
        msg: "Account created Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ZoomDrawers()));
  }
}
