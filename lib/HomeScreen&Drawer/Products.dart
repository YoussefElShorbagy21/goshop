import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Cart.dart';

import '../provdier/products.dart';


class ProductScreen extends StatefulWidget {
  final int productsId;
  ProductScreen({
    required int productsId
  }): this.productsId = productsId;
  @override
  State<ProductScreen> createState() => _ProductScreenState(productsId - 1);
}

class _ProductScreenState extends State<ProductScreen> {
  bool i = false;
  _ProductScreenState(this.productsId);
  final int productsId;

  @override
  void initState() {
    super.initState();
    final m = Provider.of<ProviderData>(context,listen: false);
    m.getProductById(context, productsId);
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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children:
                  [
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image(
                            image : NetworkImage(m.p[productsId].image,),
                            height: 350,
                            width: 350,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children:
                              [
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                    icon: const Icon(Icons.arrow_back_sharp,size: 30,color: Color(0xff432267),)),
                                const Spacer(),
                                IconButton(onPressed: () {
                                  setState(() {
                                    if(i == true) {
                                      i = false ;
                                    } else {
                                      i = true ;
                                    }
                                  });
                                }, icon: i == true ? const Icon(Icons.favorite,
                                  size: 30, color:  Color(0xff432267),) : const Icon(Icons.favorite_border,
                                  size: 30, color: Color(0xff432267),)

                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff432267),
                            borderRadius:  BorderRadius.circular(60)),
                        width: 80,
                        height: 30,
                        child:  Center(
                          child: Text('15% OFF',
                            style: GoogleFonts.josefinSans(
                              textStyle : TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:  BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                      ),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 418,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(m.p[productsId].title,
                              style: GoogleFonts.josefinSans(
                                textStyle : TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff432267),
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(m.p[productsId].category,
                              style:  GoogleFonts.josefinSans(
                                textStyle : TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff432267),
                                  fontWeight: FontWeight.w600,
                                ),),),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children:
                              [
                                Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                Icon(Icons.star_half_rounded,color: Color(0xffE99000),size: 20,),
                                Text('+23',style: GoogleFonts.josefinSans(
                                  textStyle : TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff432267),
                                    fontWeight: FontWeight.w600,
                                  ),),),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(m.p[productsId].description,
                              style:  GoogleFonts.josefinSans(
                                textStyle : TextStyle(
                                  fontSize: 19,
                                  color: Color(0xff432267),
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Card(
                                elevation: 10,
                                color: Color(0xff432267),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:SizedBox(
                                  width: 250,
                                  height: 60,
                                  child: MaterialButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  cart(title: '',)));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        Text(m.p[productsId].price.toString(),
                                          style: GoogleFonts.josefinSans(
                                            textStyle : TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('|',style: GoogleFonts.josefinSans(
                                          textStyle : TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ImageIcon(
                                          AssetImage("assets/images/shopping-bag.png"),
                                          color: Color(0xffE99000),
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Add to Cart',
                                          style: GoogleFonts.josefinSans(
                                            textStyle : TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
