import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../LogIn&SignUp/Login Screen/Log_In_Screen.dart';
import '../LogIn&SignUp/Sign Up Screen/Sign_Up_Screen.dart';



class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class BoardingModel  {
  final String image ;
  final String txt ;
  final String txt1 ;
  final String txt2 ;
  final Color color ;
  final Color color1 ;

  BoardingModel({
    required this.image ,
    required this.txt,
    required this.txt1,
    required this.txt2,
    required this.color,
    required this.color1,
  }) ;
}

class _OnBoardingState extends State<OnBoarding> {
  String? finalEmail;
  late int index;
  var boardController = PageController();
  List<BoardingModel> onboardingPagesList =
  [
    BoardingModel(txt1: 'Skip', txt2: 'Next', txt: 'We Strive to have a positive impact on customers, employees, small businesses, the economy and communities.', image: 'assets/images/Catalogue-amico.svg',color: Colors.orange,color1: Colors.white),
    BoardingModel(image: 'assets/images/Free shipping-pana.svg',txt: 'We promote the fact that we offer free shipping for all orders.',txt1: 'Back',txt2: 'Next',color: Colors.orange,color1: Colors.white),
    BoardingModel(image: 'assets/images/Mobile Marketing-pana.svg',txt: 'Be sure to log in to be able to book newly added offers.',txt1: 'Log in',txt2: 'Register',color: Colors.white,color1: Colors.orange),
  ];
  // void initState(){
  //   WidgetsFlutterBinding.ensureInitialized();
  //   getValidationData().whenComplete(() async{
  //     Timer(Duration(seconds: 2), (){
  //       setState(() {
  //         if(finalEmail == null){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
  //         }else{
  //           Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ZoomDrawers()));
  //         }
  //       });
  //     }
  //     // => Get.to(finalEmail == null ? LoginScreen() : HomePage())
  //     );
  //   });
  //   super.initState();
  // }
  // Future getValidationData() async{
  //   WidgetsFlutterBinding.ensureInitialized();
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString("email");
  //   setState(() {
  //     finalEmail = obtainedEmail;
  //   });
  //   print("The Value Of The Email : $finalEmail");
  // }
  Widget onBoarding(BoardingModel model) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
      [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(model.image,
               height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(model.txt,
                style:  GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: TextButton(onPressed: (){
                if(model.txt1 == 'Log in')
                {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                  });
                }
                else if(model.txt1 == 'Skip')
                  {
                    boardController.animateToPage(2,duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                else
                  {
                    boardController.animateToPage(0,duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
              },
                child: Text(model.txt1,
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ),
            ),
             Text('|',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 35,
                color: Color(0xffE99000),
              ),),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: TextButton(onPressed: () {
                if(model.txt2 == 'Next') {
                  setState(() {
                    boardController.nextPage(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  });
                }
                else
                  {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SignUpScreen()));
                    });
                  }
              },
                child: Text(model.txt2,
                  style:  GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      color: model.color,
                      fontWeight: FontWeight.w600,
                    ),),

                ),
              ),

            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
              children:
          [
          SmoothPageIndicator(
                 controller: boardController,
                count: onboardingPagesList.length,
                effect:    const ExpandingDotsEffect(
                  dotColor: Colors.white  ,
                  activeDotColor: Color(0xffE99000),
                  dotWidth: 10,
                  dotHeight: 10,
                  expansionFactor: 3,
                  spacing: 8,
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff432267),
        actions:
        [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              color: Color(0xff432267),
              child: InkWell(
                onTap: (){
                  setState(() {
                    boardController.animateToPage(2,duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  });
                },
                child:   Text(
                  'Skip',
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      color: Color(0xffE99000),
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xff432267),
      body: PageView.builder(
        itemBuilder:(context , index) => onBoarding(onboardingPagesList[index]),
        physics: const BouncingScrollPhysics(),
        controller:  boardController,
        itemCount: onboardingPagesList.length,
      )
    );
  }
}
