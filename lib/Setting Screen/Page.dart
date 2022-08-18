import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';

import 'IconWidget.dart';
import 'Settings Screen.dart';

class pageacc extends StatefulWidget {
  const pageacc({Key? key}) : super(key: key);

  @override
  State<pageacc> createState() => _pageaccState();
}

class _pageaccState extends State<pageacc> {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Color(0xff432267),
            centerTitle: true,
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            title:  Text('Account Setting',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                textStyle:TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),)
              ,),
            actions: [

              AppIcons(iconSource: "assets/images/home.svg",press:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
              }
              ),
            ],
            leading : IconButton(icon: Icon(
              Icons.arrow_back
            ),onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            },
            ),
          ),
        ),
        backgroundColor: Color(0xff432267),
      body: SettingsGroup(
        title: '',
        children: <Widget>[
          buildLanguage(),
          buildLocation(),
          buildPassword(),
          buildPrivacy(context),
          buildSecurity(context),
          buildAccountinfo(context),
        ],
      )
    );
  }

  Widget buildLanguage()  => DropDownSettingsTile(
    title: 'App Language',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    settingKey: keyLanguage,
    selected: 1,
    values: <int, String>{
      1: 'English',
      2: 'Arabic',
      3: 'Spanish',
      4: 'Chinese',
    },
    onChange: (language){},
  );
  Widget buildLocation()  => TextInputSettingsTile(
    settingKey: keyLocation,
    title: 'Loction',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    initialValue: 'Egypt',
    onChange: (Location){},
  );
  Widget buildPassword()  => TextInputSettingsTile(
    settingKey: keyPassword,
    title: 'Password',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    obscureText: true,
    validator: (password) => password != null && password.length >= 6 ? null : "Enter 6 Characters",
  );
  Widget buildPrivacy(BuildContext context)  => SimpleSettingsTile(
    title: 'Privacy',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.lock,

    ),
    onTap: () => showToast('Clicked Privacy'),
    // onTap: () => Utils.showSnackBar(context,'Clicked Privacy'),
  );
  Widget buildSecurity(BuildContext context)  => SimpleSettingsTile(
    title: 'Security',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.security,
    ),
    onTap: () => showToast('Clicked Security'),
    // onTap: () => Utils.showSnackBar(context,'Clicked Delete Account'),
  );
  Widget buildAccountinfo(BuildContext context)  => SimpleSettingsTile(
    title: 'Account Info',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 25,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.text_snippet,
    ),
    onTap: () => showToast('Clicked Account Info'),
  );
}

void showToast (msg) => Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Color(0xffE99000),
    textColor: Color(0xff432267),
    fontSize: 22
);
