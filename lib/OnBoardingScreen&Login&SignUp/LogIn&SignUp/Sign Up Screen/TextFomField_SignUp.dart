import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Sign%20Up%20Screen/TextFieldContainerSignUP.dart';
import '../../../HomeScreen&Drawer/ZoomDrawer.dart';
import '../../../models/usermodel.dart';
import '../Login Screen/Button.dart';


extension StringExtensions on String {
  bool isValidUserName() {
    return RegExp(
        r'^[a-zA-Z0-9 ]([._-](?![._-])|[a-zA-Z0-9 ]){3,18}[a-zA-Z0-9 ]$')
        .hasMatch(this);
  }
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
  bool isValidPassword(){
    return RegExp(
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$'
    ).hasMatch(this);
  }
  bool isValidLocation(){
    return RegExp(
        r'^[a-zA-Z0-9 ]([._-](?![._-])|[a-zA-Z0-9 ]){3,18}[a-zA-Z0-9 ]$'
    ).hasMatch(this);
  }
  bool isValidCity(){
    return RegExp(
        r'^[a-zA-Z0-9 ]([._-](?![._-])|[a-zA-Z0-9 ]){3,18}[a-zA-Z0-9 ]$'
    ).hasMatch(this);
  }
  bool isValidPhoneNumber(){
    return RegExp(
        r'^[0][1-9]\d{9}$|^[1-9]\d{10}$'
    ).hasMatch(this);
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
  var locationController = TextEditingController();
  var cityController = TextEditingController();
  var phoneController = TextEditingController();
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
            TextFieldContainerSign(
              child: TextFormField(
                validator: (s){
                  if(!s!.isValidUserName()){
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
            TextFieldContainerSign(
              child: TextFormField(
                validator: (s){
                  if (!s!.isValidLocation()) {

                    return "Enter a valid City";
                  }
                },
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.w600,
                  ),),
                cursorColor: Color(0xFF6F35A5),
                controller: cityController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'User City',
                  labelStyle: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6F35A5),
                      fontWeight: FontWeight.w600,
                    ),),
                  hintText: 'User City',
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
            TextFieldContainerSign(
              child: TextFormField(
                validator: (s){
                  if (!s!.isValidLocation()) {
                    // if(!s!.isValidEmail()){
                    return "Enter a valid Location";
                  }
                },
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.w600,
                  ),),
                cursorColor: Color(0xFF6F35A5),
                controller: locationController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'User Location',
                  labelStyle: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6F35A5),
                      fontWeight: FontWeight.w600,
                    ),),
                  hintText: 'User Location',
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
            TextFieldContainerSign(
              child: TextFormField(
                validator: (s){
                  if (!s!.isValidPhoneNumber()) {
                    return "Enter a valid Phone";
                  }
                },
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.w600,
                  ),),
                cursorColor: Color(0xFF6F35A5),
                controller: phoneController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'User Phone Number',
                  labelStyle: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6F35A5),
                      fontWeight: FontWeight.w600,
                    ),),
                  hintText: 'User Phone Number',
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
            TextFieldContainerSign(
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
            TextFieldContainerSign(
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
                text: 'SignUP' ,
                press: (){
                  final isValid = formKey.currentState!.validate();
                  print("Form Is Valid : $isValid");
                  if(isValid == true){
                    singUp(
                        emailController.text,
                        passwordController.text,
                    );
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
    userModel.phone = phoneController.text;
    userModel.city = cityController.text;
    userModel.location = locationController.text;


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
