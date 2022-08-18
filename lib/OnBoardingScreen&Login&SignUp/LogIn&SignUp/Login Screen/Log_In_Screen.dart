import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Log_In_Background.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/TextFormField.dart';
import '../Sign Up Screen/Sign_Up_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LogInScreenState();
}
class _LogInScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackGround(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Login'.toUpperCase(),
                style: TextStyle(
                  color: Color(0xFF6F35A5),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.3,
              ),
              TextFormFieldLogin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text(
                        'Don\'t Have An Account?'
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return const SignUpScreen();
                              },
                            )
                        );
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color(0xFF6F35A5)
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

