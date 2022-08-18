import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'IconWidget.dart';

class AccountPage extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
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
        child: SettingsScreen(
          title: "Account Setting",
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
    },
    // onTap: () => Utils.showSnackBar(context,'Clicked Logout'),
  );
  Widget buildLanguage()  => DropDownSettingsTile(
    title: 'Account Setting',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
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
        fontSize: 20,
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
        fontSize: 20,
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
        fontSize: 20,
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
        fontSize: 20,
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
        fontSize: 20,
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
    fontSize: 18
);
