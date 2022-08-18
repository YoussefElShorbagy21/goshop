import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01
        ),
      width: size.width * 0.8,
      child: Row(
        children: const [
          Expanded(
              child: Divider(
                color: Color(0xFF6F35A5),
                height: 2,
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5,
            ),
            child: Text(
              'OR',
              style: TextStyle(
                color:  Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ),
          Expanded(
              child: Divider(
                color: Color(0xFF6F35A5),
                height: 2,
              )
          ),
        ],
      ),
    );
  }
}

