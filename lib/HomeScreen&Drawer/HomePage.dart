import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/Categorys.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Cart.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/WishList.dart';
import 'package:tasks/HomeScreen&Drawer/Products.dart';
import '../provdier/products.dart';

class HomePage  extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   CarouselSliderController? _sliderController;
   bool i = false;
   final List<String> title = [
     "electronics",
     "jewelery",
     "men's clothing",
     "women's clothing",
   ];
   @override
   void initState() {
     super.initState();
     final m = Provider.of<ProviderData>(context,listen: false);
     m.getProducts(context);
   }
   
  @override
  Widget build(BuildContext context) {
    final m = Provider.of<ProviderData>(context);
    return ChangeNotifierProvider(
      create: (context) => ProviderData(),
      child: Consumer<ProviderData>(
          builder: (BuildContext context, ProviderData, Widget? child)
          {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff432267),
                centerTitle: true,
                title: Text('Home',
                    style: GoogleFonts.josefinSans(
                      textStyle:const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),)
                ),
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: const Radius.circular(40))
                ),
                actions: [
                  AppIcons(iconSource: "assets/images/shopping-bag.svg",
                      press:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const cart(title: '',)));
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
                          textStyle:const TextStyle(
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
              body: m.p.isEmpty ?  const Center(child:  CircularProgressIndicator()) : SingleChildScrollView(
                child: Column(
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Text('Category',
                                style: GoogleFonts.josefinSans(
                                  textStyle:const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),)
                            ),
                            TextButton(onPressed: (){},
                              child: Text('See all (15)',
                                  style: GoogleFonts.josefinSans(
                                    textStyle:const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff9F94AB),
                                      fontWeight: FontWeight.w600,
                                    ),)
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder:  (context, index) => bulideCategoriesItem(context,title[index],index),
                          separatorBuilder: (context , index) => const SizedBox(width: 15,),
                          itemCount: title.length,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ListView(children:
                        [
                          SizedBox(
                            height:200,
                            child: CarouselSlider.builder(
                              unlimitedMode: true,
                              controller: _sliderController,
                              slideBuilder: (index) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: Image(
                                      image : NetworkImage(m.p[index].image,),
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.contain,
                                    ),
                                );
                              },
                              slideTransform: const CubeTransform(),
                              itemCount:4,
                              initialPage: 0,
                              enableAutoSlider: true,
                            ),
                          ),
                        ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Popular',
                              style: GoogleFonts.josefinSans(
                                textStyle:const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          childAspectRatio: 1 / 1.72 ,
                          children: List.generate(
                            m.p.length, (index) => buliderGridProduct(
                            context,
                            m.p[index].image,
                            m.p[index].price,
                            m.p[index].category,
                            m.p[index].id,
                          ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            );
          }
      ),
    );
  }


     Widget bulideCategoriesItem(BuildContext context , String Cate , int i) =>  InkWell(
    onTap: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              Categories(productsId: title[i],)));
    },
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children:
      [
        SvgPicture.asset('assets/images/Popular 3.svg',
          width: 250,
        ),
        Center(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.pinkAccent.withOpacity(0.05),
            child:  Center(
              child: Text(Cate,
              style: GoogleFonts.josefinSans(
                textStyle:const TextStyle(
                  fontSize: 25,
                  color: Color(0xff9F94AB),
                  fontWeight: FontWeight.w600,
                ),)
              ),
            ) ,
          ),
        ),
      ],
    ),
  );

     Widget buliderGridProduct(BuildContext context, String imag , double d , String cm , int id) => InkWell(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context) =>   ProductScreen(productsId: id,)));
     },
     child: Container(
       height: double.infinity,
       color: Colors.white,
       child: Column(
         children:
         [
           Row(
             children:
             [
               Container(
                 alignment: Alignment.center,
                 padding: const EdgeInsets.all(2),
                 margin: const EdgeInsets.all(8),
                 width: 80,
                 height: 25,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25),
                   color: const Color(0xff9F94AB),
                 ),
                 child:  Text(
                   '15% OFF',
                   style: GoogleFonts.josefinSans(
                     textStyle : const TextStyle(
                       fontSize: 18,
                       color:  Color(0xffE9BC6B),
                       fontWeight: FontWeight.w600,
                     ),),

                 ),
               ),
               const Spacer(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: IconButton(onPressed: () {
                   setState(() {
                     if(i == true) {
                       i = false ;
                     } else {
                       i = true ;
                     }
                   });
                 }, icon: i == true ? const Icon(Icons.favorite,
                 size: 25,) : const Icon(Icons.favorite_border,
                   size: 25,)

                 )
               ),
             ],
           ),
           Image(
             image : NetworkImage(imag,),
             height: 160,
             width: 150,
             fit: BoxFit.contain,
           ),
           const SizedBox(
             height: 30,
           ),
           Card(
              elevation: 10,
             color: Colors.white,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15),
             ),
             child: Row(
               children:
               [
                 Container(
                   width: 100,
                   height: 35,
                   padding: const EdgeInsets.only(left: 15),
                   child:  Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(cm,
                       style: GoogleFonts.josefinSans(
                         textStyle : const TextStyle(
                           fontStyle: FontStyle.italic,
                           fontSize: 15,
                           color:  Color(0xff432267),
                           fontWeight: FontWeight.w600,
                         ),),
                        ),
                     ],
                   ),
                 ),
                 const Spacer(),
                 Container(

                   decoration: const BoxDecoration(
                     color:  Color(0xff432267),
                     borderRadius:  BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                   ),
                 width: 50,
                 height: 40,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:
                    [
                      const ImageIcon(
                         AssetImage("assets/images/shopping-bag.png"),
                        color: Colors.white,
                        size: 18,
                      ),
                     Text(d.toString(),
                     style: GoogleFonts.josefinSans(
                       textStyle : const TextStyle(
                         fontStyle: FontStyle.italic,
                         fontSize: 15,
                         color: Colors.white,
                         fontWeight: FontWeight.w600,
                       ),),
                     )
                   ],
                 )
               ),
               ],
             )
           )
         ],
       ),
     ),
   );
}
