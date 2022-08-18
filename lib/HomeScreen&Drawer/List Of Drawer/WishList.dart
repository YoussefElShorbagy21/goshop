import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
import 'package:tasks/provdier/products.dart';

class Wishlist extends StatefulWidget {
  final int productsId;
  List fav = [] ;
  Wishlist({
    required int productsId,
  }): this.productsId = productsId;

  @override
  State<Wishlist> createState() => _WishlistState(productsId);
}

enum ViewType { grid, list }

class _WishlistState extends State<Wishlist> {
  _WishlistState(this.productsId);
  final int productsId;
  int crossAxisCount = 2;
  double aspectRatio = 1 / 1.72;
  ViewType viewType = ViewType.grid;
  late Color colorg = Colors.black;
  late Color colorl = Colors.black;
  Color ? myColor = Colors.white;
  final List<String> img = [
    'assets/images/OnBoarding 1.svg',
    'assets/images/OnBoarding 2.svg',
    'assets/images/OnBoarding 3.svg',
    'assets/images/OnBoarding 2.svg',

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final m = Provider.of<ProviderData>(context,listen: false);
    m.getProductByIdIsFav(context, productsId);
    print(productsId);
  }

  @override
  Widget build(BuildContext context) {
    final m = Provider.of<ProviderData>(context);
    return ChangeNotifierProvider(
      create: (_) => ProviderData(),
      child: Consumer<ProviderData>(
        builder: (BuildContext context , ProviderData,Widget? child)
        {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: AppBar(
                backgroundColor: Color(0xff432267),
                centerTitle: true,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30)
                        ,bottomRight: Radius.circular(30))
                ),
                title:  Text('Wishlist',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),)
                  ,),
                actions: [
                  AppIcons(iconSource: "assets/images/home.svg",press:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
                  }
                  ),
                ],
                leading : AppIcons(iconSource: "assets/images/menu.svg",press:(){
                  ZoomDrawer.of(context)!.toggle();
                },
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                  children:
                  [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children:
                        [
                          Text('May your wishes come true',
                              style: GoogleFonts.josefinSans(
                                textStyle:TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff432267),
                                  fontWeight: FontWeight.w600,
                                ),)
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: (){
                              crossAxisCount = 1;
                              aspectRatio =  1/0.3;
                              viewType = ViewType.list;
                              colorl = const Color(0xffE99000);
                              colorg = Colors.black;
                              setState(() {});
                            },
                            icon: Icon(Icons.view_list,size: 30,
                              color: colorl,
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              crossAxisCount = 2;
                              aspectRatio = 1 / 1.72;
                              viewType = ViewType.grid;
                              colorg = const Color(0xffE99000);
                              colorl = Colors.black;
                              setState(() {});
                            },
                            icon: Icon(Icons.grid_view_sharp,size: 30,
                              color: colorg,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          childAspectRatio: aspectRatio ,
                          children:  viewType == ViewType.grid ?
                          List.generate(img.length,
                                  (index) => buliderGridProduct(context,index,m.p[productsId].title))
                              : List.generate(img.length, (index) => buliderListProduct(context, index))
                      ),
                    ),
                  ]
              ),
            ),
          );
        },
      ),
    );
  }


  Widget buliderGridProduct(BuildContext context, int i,String f) => SingleChildScrollView(
    child: Container(
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
                  color: Color(0xff9F94AB),
                ),
                child:  Text(
                  '15% OFF',
                  style: GoogleFonts.josefinSans(
                    textStyle : TextStyle(
                      fontSize: 18,
                      color: Color(0xffE9BC6B),
                      fontWeight: FontWeight.w600,
                    ),),

                ),
              ),
              const Spacer(),
              const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff432267),
                    child: Icon(Icons.favorite_sharp,
                    size: 30,
                    color: Color(0xffE99000),
                    ),
                  )
              ),
            ],
          ),
          SvgPicture.asset(img[i],
            height: 200,
            width: 200,
            fit: BoxFit.contain,
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
                    child:  Text(f,
                      style: GoogleFonts.josefinSans(
                        textStyle : TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Color(0xff432267),
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xff432267),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15)
                              ,bottomRight: Radius.circular(15))
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
                          Text('\$ 15,99',
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
          ),
        ],
      ),
    ),
  );

  Widget buliderListProduct(BuildContext context, int i) => SingleChildScrollView(
    child: Container(

      height: 100,
      width: 100,
      margin: const EdgeInsets.only(top:5,bottom: 5, ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(left: 0,),
            child: SvgPicture.asset(img[i],
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
               Text(
                "Women's Fall Winter Scarf \nAmerican Trends",
                style: GoogleFonts.josefinSans(
                  textStyle : const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Color(0xff432267),
                    fontWeight: FontWeight.w600,
                  ),),
              ),
              Row(
                children:   [
                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                  Icon(Icons.star_half_rounded,color: Color(0xffE99000),size: 20,),
                  Text('+23',
                    style: GoogleFonts.josefinSans(
                    textStyle : const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      color: Color(0xff432267),
                      fontWeight: FontWeight.w600,
                    ),),),
                  const SizedBox(width: 62,),
                ],
              ),
              const SizedBox(
                height: 8,),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(color:   Color(0xff432267) ,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),),),
                child: Icon(Icons.favorite,color: Color(0xffE99000),size:25)
            ),
          ),
        ],
      ),
    ),
  );
}
