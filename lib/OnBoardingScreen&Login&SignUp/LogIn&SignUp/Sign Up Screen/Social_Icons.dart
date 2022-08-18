import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcons extends StatelessWidget {
  final String iconSource;
  final VoidCallback press;

  const SocialIcons({
    Key? key,
    required this.iconSource,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xFF6F35A5),
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSource,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
