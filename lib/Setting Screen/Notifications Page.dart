import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';

import 'IconWidget.dart';
import 'Settings Screen.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyNewsletter = 'key-newsletter';
  static const keyAppUpdates = 'key-appupdates';

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
          title:'',
          children: [
            buildNews(),
            buildActivity(),
            buildNewsletter (),
            buildAppUpdates(),
          ],
        )
    );
  }
  Widget buildNews()  => SwitchSettingsTile(
      settingKey: keyNews,
      title: 'News For You',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 25,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.message,
      )
  );

  Widget buildActivity()  => SwitchSettingsTile(
      settingKey: keyActivity,
      title: 'Account Activity',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 25,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.person,
      )
  );
  Widget buildNewsletter()  => SwitchSettingsTile(
      settingKey: keyNewsletter,
      title: 'Newsletter',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 25,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.text_snippet,
      )
  );
  Widget buildAppUpdates()  => SwitchSettingsTile(
      settingKey: keyAppUpdates,
      title: 'App Updates',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 25,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.update,
      )
  );
}



/*class NotificationsPage extends StatelessWidget {
  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyNewsletter = 'key-newsletter';
  static const keyAppUpdates = 'key-appupdates';
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
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
      child: SettingsScreen(
        title: 'Noticiations',
        children: [
          buildNews(),
          buildActivity(),
          buildNewsletter (),
          buildAppUpdates(),
        ],
      ),
    );
}

  Widget buildNews()  => SwitchSettingsTile(
      settingKey: keyNews,
      title: 'News For You',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 20,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
      leading: IconWidget(
        icon: Icons.message,
      )
  );

  Widget buildActivity()  => SwitchSettingsTile(
    settingKey: keyActivity,
    title: 'Account Activity',
      titleTextStyle: GoogleFonts.josefinSans(
        textStyle:TextStyle(
          fontSize: 20,
          color: Color(0xffE99000) ,
          fontWeight: FontWeight.w600,
        ),),
    leading: IconWidget(
      icon: Icons.person,
    )
);
Widget buildNewsletter()  => SwitchSettingsTile(
    settingKey: keyNewsletter,
    title: 'Newsletter',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    leading: IconWidget(
      icon: Icons.text_snippet,
    )
);
Widget buildAppUpdates()  => SwitchSettingsTile(
    settingKey: keyAppUpdates,
    title: 'App Updates',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    leading: IconWidget(
      icon: Icons.update,
    )
);
}*/
