
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/checkout_screen.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
class history extends StatefulWidget {
  const history({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<history> createState() => _history();
}
class _history extends State<history> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
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
        title: Text('Order History',
            style: GoogleFonts.josefinSans(
              textStyle:const TextStyle(
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
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.9,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int position) {
                    return Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top:5,bottom: 5,left: 0 ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                            child:
                            Container(
                              alignment: Alignment.center,
                              height: 150,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.005,
                              ),
                              Row(
                              children: [
                                   Text("#136985",style: GoogleFonts.josefinSans(
                                     textStyle:TextStyle(
                                       fontSize: 17,
                                       color: Color(0xff9F94AB),
                                       fontWeight: FontWeight.w600,
                                     ),),
                                   ),
                                   SizedBox(width: 20,),
                                   Text("   10 Aug 2020",style: GoogleFonts.josefinSans(
                                     textStyle:TextStyle(
                                       fontSize: 17,
                                       color: Color(0xff9F94AB),
                                       fontWeight: FontWeight.w600,
                                     ),),),
                                 ],
                              ),
                              SizedBox(
                                height: 5,
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
                                width: 45,
                                height: 30,
                                margin: EdgeInsets.only(bottom: 0,right: 0,left:153,top: 0, ),
                                decoration: BoxDecoration(color: Color(0xff432267) ,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),
                                child: Icon(Icons.share,color: Color(0xffE99000),size:25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),

            Container(
                width: 340,
                height: 60,
                margin: EdgeInsets.only(top: 680,left: 10,right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                //alignment: Alignment.center
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor),
                  ),
                  onPressed: () {
                    setState(() {

                    });
                  }, child:
                Row(
                  children: [
                    SizedBox(width: 65,),
                    IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
                        },
                        icon: Icon(Icons.wallet,color:Color(0xffE99000) ,size: 25,)),
                    SizedBox(width: 20,),
                    Text("Checkout ",
                      style: GoogleFonts.josefinSans(
                        textStyle:TextStyle(
                          fontSize: 25,
                          color: Color(0xff9F94AB),
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                  ],
                ),

                )
            ),
          ],
        ),
      ),
    );


  }
}

