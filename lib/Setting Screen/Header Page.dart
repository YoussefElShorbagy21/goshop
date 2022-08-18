import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';

import 'IconWidget.dart';

class HeaderPage extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // buildHeader(),
        SizedBox(
          height: size.height * 0.03,
        ),
        // buildUser(context),
        buildDarkMode(),

      ],
    );
  }
  Widget buildDarkMode()  => SwitchSettingsTile(
    title: 'Dark Mode',
    titleTextStyle: GoogleFonts.josefinSans(
      textStyle:TextStyle(
        fontSize: 20,
        color: Color(0xffE99000) ,
        fontWeight: FontWeight.w600,
      ),),
    settingKey: keyDarkMode,
    leading: IconWidget(
      icon: Icons.dark_mode,
    ),
    onChange: (isDarkMode){},
  );
}
