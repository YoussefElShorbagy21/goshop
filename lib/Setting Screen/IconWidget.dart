
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;

  const IconWidget({
    Key? key,
    required this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE99000)
      ),
      child: Icon(icon,color: Color(0xff432267),),
    );
  }
}
