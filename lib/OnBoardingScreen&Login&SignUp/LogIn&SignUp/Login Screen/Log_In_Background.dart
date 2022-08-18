import 'package:flutter/material.dart';


class LoginBackGround extends StatelessWidget {
  final Widget child;
  const LoginBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login bottom.png",
                width: size.width * 0.4,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
