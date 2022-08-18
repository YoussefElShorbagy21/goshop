import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/checkout_screen.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
class cart extends StatefulWidget {
  const cart({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<cart> createState() => _cart();
}

class _cart extends State<cart> {

  final List<String> ImagesFashionGirl = [
    'assets/images/OnBoarding 1.svg',
    'assets/images/OnBoarding 1.svg',
    'assets/images/OnBoarding 1.svg',
    'assets/images/OnBoarding 1.svg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color ? myColor =  Color(0xff432267);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff432267),
        centerTitle: true,
        title: Text('Cart',
            style: GoogleFonts.josefinSans(
              textStyle:TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),)
        ),
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
        ),
        actions: [
          AppIcons(iconSource: "assets/images/home.svg",
              press:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
              }
          )

        ],
        leading : AppIcons(iconSource: "assets/images/menu.svg",
            press:() {
              ZoomDrawer.of(context)!.toggle();
            }
        )

        // leading: AppIcons(iconSource: "assets/images/menu.svg",press:(){
        //   ZoomDrawer.of(context)!.toggle();
        // },
        // ),
        // leading: IconButton(onPressed: (){
        //   ZoomDrawer.of(context)!.toggle();
        //   },
        //   icon: const Icon(Icons.list_sharp),
        // ),
        ,bottom:  PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SizedBox(
          width: 285,
          height: 50,
          child:  TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:  const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                hintText: 'Type a Product Name',
                hintStyle: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontSize: 16,
                    color: Color(0xff9F94AB),
                    fontWeight: FontWeight.w600,
                  ),),
                prefixIcon: const Icon(Icons.search,size: 30,color: Color(0xff432267),),
                suffixIcon: AppIcons(iconSource: "assets/images/Group 288.svg",
                  press:() {

                  },
                )
              // suffixIcon: AppIcons(iconSource: "assets/images/Group 288.svg",press:() {
              // }
              // ),
            ),
            cursorColor: Colors.grey,
          ),
        ),
      ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0,top: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Product:..',style:  GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),),
                  SizedBox(width: 45,),
                  Text('Subtotal:..',style:  GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),),
                  SizedBox(width: 45,),
                  Text('Taxes:..',style:  GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),)
                ],
              ),
          ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int position) {
                      return Container(
                        alignment: Alignment.center,
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(top:5,bottom: 5,left: 15 ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                              child:
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.green,
                                margin: const EdgeInsets.only(left: 0,),
                                child: SvgPicture.asset("assets/images/Popular 2.svg",
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Container(
                                      margin: EdgeInsets.only(top: 0,left: 190),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color(0xff432267),),
                                      child:
                                      Icon(Icons.close,color: Colors.white,size: 10,),
                                    ),
                                 Text(
                                  "Women's Fall Winter Scarf \nAmerican Trends",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.josefinSans(
                                    textStyle:TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                    Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                    Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                    Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                    Icon(Icons.star_half_rounded,color: Color(0xffE99000),size: 20,),
                                    Text('+23',style: GoogleFonts.josefinSans(
                                      textStyle:TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),),),
                                    SizedBox(width: 62,),
                                  ],
                                ),
                      Container(
                        width: 80,
                        height: 30,
                        margin: EdgeInsets.only(bottom: 0,right: 0,left:130,top: 0, ),
                        decoration: BoxDecoration(color: Color(0xff432267) ,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),
                        child:
                        Row(
                          children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                            },
                              child: Icon(Icons.minimize_outlined,color: Color(0xffE99000),size:20)),
                          SizedBox(
                            width: 7,),

                          Text('1',style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(width: 7,),

                          Icon(Icons.add,color: Color(0xffE99000),size:20),
                          SizedBox(width: 5,),
                        ],),
                      ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet:  Container(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: Color(0xff432267),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  CheckoutScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SvgPicture.asset(
                   "assets/images/Icon_Credit Card.svg",
                 width: 0,
                 alignment: Alignment.center,
                 color: Colors.orange,
                 height: 26,
               ),
                SizedBox(
                  width: 15,
                ),
                Text('Checkout',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
}
