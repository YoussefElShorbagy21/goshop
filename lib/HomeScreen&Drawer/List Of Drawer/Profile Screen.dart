import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/EditProfile.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Cart.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/OrderHistory.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/WishList.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/checkout_screen.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';

import '../../models/usermodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel data = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('users')
        .doc(user!.uid)
        .get().then((value){
      this.data = UserModel.fromMap(value.data());
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons(iconSource: "assets/images/menu.svg",press:(){
          ZoomDrawer.of(context)!.toggle();
        },
        ),
        backgroundColor: Color(0xff432267),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
        ),
        actions: [ AppIcons(iconSource: "assets/images/home.svg",press:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
        }
        ),
        ],
         bottom: PreferredSize(
           preferredSize: Size.fromHeight(size.height * 0.3),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 // margin: const EdgeInsets.only(left: 20),
                 width: 120,
                 height: 120,
                 child: CircleAvatar(
                   backgroundColor: Color(0xff432267),
                   child:  Container(
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(60),
                       child: Image(
                         width: size.width * 0.5,
                         height: size.height * 0.5,
                         image: NetworkImage(data.image.toString()),
                 ),
                     ),
                   ),
               ),
               ),
               const SizedBox(
                 height: 10,
               ),
                Center(
                 child: Text(data.name.toString(),
                   style: TextStyle(
                       fontSize: 30,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),),
               ),
               const SizedBox(
                 height: 10,
               ),
                Center(
                 child: Text(data.email.toString(),
                   style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w900,
                     color: Color(0xffE99000),
                   ),)
                 ,
               ),
               const SizedBox(
                 height: 10,
               ),
             ],
           ),
         ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            edit('Edit Profile','assets/images/edit.png',Profile()),
            edit('Cart',"assets/images/shopping-bag-1 1.png",cart(title: '',)),
            edit('Wishlist',"assets/images/loved.png",Wishlist()),
            edit('Order History',"assets/images/path-10.png",history(title: '',)),
            edit('Cards',"assets/images/Icon_Credit Card.png",CheckoutScreen()),
          ],
        ),
      ),
    );
  }
  Widget edit(String txt , String icon, Widget route)
  {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: MaterialButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  route));
          },
          child: Stack(
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only()
                ),
                width: 300,
                height: 60,
                child: Card(
                  color: Color(0xff432267),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      txt,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xffFEFEFE),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  color: Color(0xff432267),
                  child: ImageIcon(
                    AssetImage(icon),
                    color: Color(0xffE99000),
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  // Widget drawerList(IconData icon , String text,int index) {
  //   return InkWell(
  //     onTap: (){
  //       widget.setIndex(index);
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(left: 20, bottom: 30),
  //       color: Color(0xff432267),
  //       child: Row(
  //         children:
  //         [
  //           Icon(icon,
  //             size: 32,
  //             color: Colors.orange,
  //           ),
  //           const SizedBox(
  //             width: 15,
  //           ),
  //           Text(text,
  //             style: const TextStyle(
  //               fontSize: 22,
  //               color: Colors.white,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}


