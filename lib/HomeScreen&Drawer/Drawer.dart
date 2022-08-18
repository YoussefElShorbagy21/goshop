import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Log_In_Screen.dart';

import '../models/usermodel.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex  ;
  const DrawerScreen({Key? key,required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel data = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('users')
        .doc(user!.uid)
        .get().then((value){
      this.data = UserModel.fromMap(value.data());
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Scaffold(
      backgroundColor: Color(0xff432267),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Column(
              children:
              [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25),
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff432267),
                      child: Image(image: NetworkImage(data.image.toString()),
                    ),
                  ),
                ),
                ),
                SizedBox(
                  height: size.height * 0.02 ,
                ),
                Center(
                  child: Text(data.name.toString(),
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),)
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01 ,
                ),
                 Center(
                  child: Text(data.email.toString(),
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 16,
                      color: Color(0xffE99000),
                      fontWeight: FontWeight.bold,
                    ),)
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            drawerList("assets/images/home-1.png",'Home',0),
            drawerList("assets/images/loved.png",'Wishlist',1),
            drawerList("assets/images/shopping-bag-1 1.png",'Cart',2),
            drawerList("assets/images/path-10.png",'Order History',3),
            drawerList("assets/images/path-11.png",'Profile',4),
            drawerList("assets/images/settings.png",'App Setting',5),
            drawerList("assets/images/help.png",'Help & FAQs',6),
            // const SizedBox(
            //   height: 35,
            // ),
            Container(
              margin: const EdgeInsets.only(left: 30,top: 30),
              child: InkWell(
                onTap: () async{
                  print("okey");
                  WidgetsFlutterBinding.ensureInitialized();
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.remove("email");
                  // // Get.to(LoginScreen());
                  logOut(context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                   [
                    ImageIcon(
                      AssetImage("assets/images/logout.png"),
                      color: Color(0xffE99000),
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Log Out',
                      style: GoogleFonts.josefinSans(
                        textStyle:TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget drawerList(String icon , String text,int index) {
    return InkWell(
      onTap: (){
        widget.setIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, bottom: 15),
        child: Row(
          children:
          [
            ImageIcon(
              AssetImage(icon),
              color: Color(0xffE99000),
              size: 30,
            ),
            // Icon(icon,
            //   size: 32,
            //   color: Colors.orange,
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(text,
            style: GoogleFonts.josefinSans (
              textStyle: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            )
            ),
          ],
        ),
      ),
    );
  }


  Future<void> logOut(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
  }
}
