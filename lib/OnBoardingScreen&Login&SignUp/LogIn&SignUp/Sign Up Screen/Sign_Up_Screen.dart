import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Log_In_Screen.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Sign%20Up%20Screen/OrDivider.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Sign%20Up%20Screen/Sign_Up_Background.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Sign%20Up%20Screen/Social_Icons.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Sign%20Up%20Screen/TextFomField_SignUp.dart';



class SignUpScreen extends StatefulWidget {
  
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Sign Up'.toUpperCase(),
                  style: TextStyle(
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.27,
                ),
                TextFormFieldSignUp(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      const Text(
                          'Already Have An Account?'
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return LoginScreen();
                                },
                              )
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(0xFF6F35A5)
                          ),
                        ),
                      ),
                    ]
                ),
                const OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcons(
                        iconSource: "assets/icons/facebook.svg",
                        press: (){

                    }
                    ),
                    SocialIcons(
                        iconSource: "assets/icons/twitter.svg",
                        press: (){

                    }
                    ),
                    SocialIcons(
                        iconSource: "assets/icons/google-plus.svg",
                        press: (){
                        }
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
