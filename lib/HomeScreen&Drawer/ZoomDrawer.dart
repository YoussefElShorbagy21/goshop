import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tasks/HomeScreen&Drawer/Drawer.dart';
import 'package:tasks/HomeScreen&Drawer/HomePage.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Cart.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/OrderHistory.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Profile%20Screen.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/WishList.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/checkout_screen.dart';


class ZoomDrawers extends StatefulWidget {
  const ZoomDrawers({Key? key}) : super(key: key);

  @override
  State<ZoomDrawers> createState() => _ZoomDrawersState();
}

class _ZoomDrawersState extends State<ZoomDrawers> {
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
        mainScreen: setScreen(),
        menuScreen: DrawerScreen(setIndex: (index)
        {
          setState(() {
            currentIndex = index ;
          });
        },),
        borderRadius: 30,
        showShadow: true,
        angle: 0.0,
        menuBackgroundColor: Color(0xff432267),
    );
  }

  Widget setScreen()
  {
    switch(currentIndex)
    {
      case 0 : return  const HomePage();
      case 1 : return  const Wishlist();
      case 2 : return  const cart(title: '',);
      case 3 : return  const history(title: '',);
      case 4 : return  const ProfileScreen();
      case 5 : return  const CheckoutScreen();
      default: return  const HomePage();

    }
  }
}
