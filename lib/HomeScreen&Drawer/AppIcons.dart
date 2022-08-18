import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppIcons extends StatelessWidget {
  final String iconSource;
  final VoidCallback press;


  const AppIcons( {
    Key? key,
    required this.iconSource,
    required this.press,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 40,
        width: 50,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(11),
        child: SvgPicture.asset(
          iconSource,
        ),
      ),
    );
  }
}
