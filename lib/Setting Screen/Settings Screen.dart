import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
import 'package:tasks/OnBoardingScreen&Login&SignUp/LogIn&SignUp/Login%20Screen/Log_In_Screen.dart';

import 'Header Page.dart';
import 'IconWidget.dart';
import 'Notifications Page.dart';
import 'Page.dart';

class SettingPage extends StatefulWidget {

  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color(0xff432267),
          centerTitle: true,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
          ),
          title:  Text('App Setting',
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
          leading : AppIcons(iconSource: "assets/images/menu.svg",press:(){
            ZoomDrawer.of(context)!.toggle();
          },
          ),
        ),
      ),
      backgroundColor: Color(0xff432267),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 0,left: 25, right: 25, bottom: 25),
          children: [
            HeaderPage(),
            SettingsGroup(
                title: 'General',
                titleTextStyle: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 20,
                    color: Color(0xffE99000) ,
                    fontWeight: FontWeight.w600,
                  ),),
                children: <Widget>[
                  SizedBox(
                      height: size.height * 0.01
                  ),
                  BuildAccountSetting(pageacc()),
                  BuildNotificationsSetting(NotificationsPage()),
                  buildLogOut(),
                  buildDeleteAccount(),
                ]
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SettingsGroup(
                title: 'FeedBack',
                titleTextStyle: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 20,
                    color: Color(0xffE99000) ,
                    fontWeight: FontWeight.w600,
                  ),),
                children: <Widget>[
                  SizedBox(
                      height: size.height * 0.01
                  ),
                  buildReportBug(context),
                  buildSendFeedback(context),
                ]
            ),

          ],
        ),
      ),
    );
  }
  Widget BuildAccountSetting(Widget setting) => SimpleSettingsTile(
      title: 'Account Setting',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 20,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      subtitle: 'Privacy, Security, Language',
      subtitleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 14,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.person,
      ),
      child: setting


  );
  Widget BuildNotificationsSetting(Widget setting) => SimpleSettingsTile(
      title: 'Noticiations',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 20,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      subtitle: 'Newsletter, App Updates',
      subtitleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 14,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
          icon : Icons.notifications
      ),
      child: setting


  );
  Widget buildLogOut()  => SimpleSettingsTile(
    title: 'Logout',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.logout,
    ),
    onTap: () {
      Settings.clearCache();
      showToast('Clicked Logout');
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    },
    // onTap: () => Utils.showSnackBar(context,'Clicked Logout'),
  );
  Widget buildDeleteAccount()  => SimpleSettingsTile(
    title: 'Delete Account',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 20,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.delete_forever ,

    ),
    onTap: () {}
  );
  Widget buildAccount()  => SimpleSettingsTile(
    title: 'Account Setting',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: 'Privacy, Security, Language',
    subtitleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 15,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    leading: IconWidget(
      icon: Icons.person,

    ),
    child: Container(),
    onTap: (){},
  );
  Widget buildReportBug(BuildContext context)  => SimpleSettingsTile(
    title: 'Report A Bug',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',
    leading: IconWidget(
      icon: Icons.bug_report,

    ),
    onTap: () => showToast('Clicked Report A Bug'),
  );
  Widget buildSendFeedback(BuildContext context)  => SimpleSettingsTile(
    title: 'Send Feedback',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    subtitle: '',

    leading: IconWidget(
      icon: Icons.thumb_up,
    ),
    onTap: () => showToast('Clicked Send Feedback'),
    // onTap: () => Utils.showSnackBar(context,'Clicked Send Feedback'),
  );
}
void showToast (msg) => Fluttertoast.showToast(
    msg: msg,
  backgroundColor: Color(0xffE99000),
  textColor: Color(0xff432267),
  fontSize: 18
);




