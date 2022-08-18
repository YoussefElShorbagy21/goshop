import 'package:flutter/material.dart';

class TextFieldContainerSign extends StatelessWidget {
  final Widget child;
  const TextFieldContainerSign({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:1 ),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical:0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
