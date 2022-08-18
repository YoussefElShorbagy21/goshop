import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const Color value = Color(0xFF6F35A5);
  final String  text;
  final VoidCallback press;
  final Color color, textColor;
   const Button({
    Key? key,
    required this.text,
    required this.press,
    this.color = value,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: press,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
