import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
import 'package:tasks/provdier/products.dart';

import 'HomeScreen&Drawer/AppIcons.dart';
import 'HomeScreen&Drawer/Products.dart';

class Categories extends StatefulWidget {
  final String productsId;
  Categories({
    required String productsId
  }): this.productsId = productsId;

  @override
  State<Categories> createState() => _CategoriesState(productsId);
}

class _CategoriesState extends State<Categories> {

  _CategoriesState(this.productsId);
  final String productsId;
  bool i = false;
  @override
  void initState() {
    super.initState();
    final m = Provider.of<ProviderData>(context,listen: false);
    m.getCategories(context,productsId);
    m.categories = [] ;
  }

  @override
  Widget build(BuildContext context) {

    final m = Provider.of<ProviderData>(context);
    return ChangeNotifierProvider(
      create: (_) => ProviderData(),
      child: Consumer<ProviderData>(
        builder: (BuildContext context, ProviderData, Widget? child)
          {
           return Scaffold(
             appBar: AppBar(
               backgroundColor: Color(0xff432267),
               centerTitle: true,
               title: Text(productsId,
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
               leading : AppIcons(iconSource: "assets/images/home.svg",
                   press:() {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ZoomDrawers()));
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
              body: m.categories.isEmpty ? const Center(child:  CircularProgressIndicator()):SingleChildScrollView(
                child: Container(
                  color: Colors.grey[300],
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.72 ,
                    children: List.generate(m.categories.length , (index) => buliderGridProduct(
                      context,
                      m.categories[index].image,
                      m.categories[index].price,
                      m.categories[index].category,
                      m.categories[index].id,
                    ),
                    ),
                  ),
                ),
              ),
            ) ;
          },
      ),
    );
  }

  Widget buliderGridProduct(BuildContext context, String imag , double d , String cm , int id) {
    final m = Provider.of<ProviderData>(context);
    return InkWell(
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
                        color: Color(0xffE9BC6B),
                        fontWeight: FontWeight.w600,
                      ),),

                  ),
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: () {
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
                      height: 45,
                      padding: const EdgeInsets.only(left: 15),
                      child:  SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cm,
                              style: GoogleFonts.josefinSans(
                                textStyle : const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 17,
                                  color: Color(0xff432267),
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(

                        decoration: const BoxDecoration(
                            color:  Color(0xff432267),
                            borderRadius: BorderRadius.only(topRight:  Radius.circular(15),bottomRight: Radius.circular(15))
                        ),
                        width: 60,
                        height: 45,
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
}
