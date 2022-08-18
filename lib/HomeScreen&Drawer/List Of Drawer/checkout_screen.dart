import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tasks/HomeScreen&Drawer/AppIcons.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/edit_card.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  int index =  0 ;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  var boardController = PageController();
  var street1Controller = TextEditingController();
  var street2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  List<StepperData> stepperData = [
    StepperData(
      title: "Address",
      subtitle: '',
    ),
    StepperData(
      title: "Payment",
      subtitle: "",
    ),
    StepperData(
      title: "Summary",
      subtitle: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff432267),
        centerTitle: true,
        title: const Text('Checkout'),
        leading: AppIcons(iconSource: "assets/images/menu.svg",press:(){
          ZoomDrawer.of(context)!.toggle();
        },
        ),
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
        ),
        actions: [AppIcons(iconSource: "assets/images/home.svg",press:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
        }
        ),],
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.horizontal,
            horizontalStepperHeight: 60,
            inverted: true,
            activeIndex: index,
            gap: 50,
            activeBarColor: const Color(0xffE99000),
            inActiveBarColor: Colors.white,
            dotWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                    color: Color(0xffE99000),
                    borderRadius: BorderRadius.all( Radius.circular(30))
                    ),
          ),
        ),
      ),
      ),
      body: PageView(
        controller: boardController,
        children:
        [
          address(),
          payments(),
          summary(),
        ],
      )
    );
  }

  Widget card(IconData icon){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 50,
        child: OutlinedButton(
          onPressed: (){
            setState(() {
            });
          },
          autofocus: true,
          style: OutlinedButton.styleFrom(
              primary: const Color(0xffE99000),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(45
                )
                ),
              ),
          ),
          child: Icon(icon,
          size: 25,
          ),
        ),
      ),
    );
  }
  Widget address() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              const [
                Icon(Icons.check_circle,
                  color: Color(0xffE99000),
                  size: 28,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Billing address is the same as delivery address',
                ),
              ],
            ),
            const SizedBox(height: 50,
            ),
            textAdd('Street 1',street1Controller),
            textAdd('Street 2',street2Controller),
            textAdd('City',cityController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(
                    width: 150,
                    height: 150,
                    child: textAdd('State',stateController)
                ),
                SizedBox(
                    width: 150,
                    height: 150,
                    child: textAdd('Country',countryController)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xffE9BC6B),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          )
                          ),
                        ),
                        shadowColor: Colors.red
                    ),
                    child: const Text('Back',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn);
                      index = 1 ;
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xffE99000),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          ))
                      ),
                    ),
                    child:  const Text('Next',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
  Widget payments() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            SizedBox(
              height: 100,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children:
                [
                  card(Icons.paypal_outlined),
                  card(Icons.credit_card),
                  card(Icons.wallet),
                ],
              ),
            ),
             //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: TextFormField(
      //           maxLength: 16,
      //           controller: cardNumberController,
      //           onChanged: (value)
      //           {
      //           },
      //           keyboardType: TextInputType.number,
      //           decoration:  const InputDecoration(
      //             labelText:  'Card Number' ,
      //         ),
      //   ),
      // ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children:
      //         [
      //           SizedBox(
      //               width: 150,
      //               height: 150,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(15.0),
      //                 child: TextFormField(
      //                   onChanged: (value) {
      //                     var newDateValue = value.trim();
      //                     final containsSlash = newDateValue.contains('/');
      //                     if (newDateValue.length >= 2 && !containsSlash) {
      //                       newDateValue = '${newDateValue.substring(0, 2)}/${newDateValue.substring(2)}';
      //                     }
      //                     setState(() {
      //                       expiryDateController.text = newDateValue;
      //                       expiryDateController.selection = TextSelection.fromPosition(
      //                           TextPosition(offset: newDateValue.length));
      //                     });
      //                   },
      //                   controller: expiryDateController,
      //                   keyboardType: TextInputType.datetime,
      //                   maxLength: 5,
      //                   decoration:  const InputDecoration(
      //                     labelText:  'Expiry Date' ,
      //                   ),
      //                 ),
      //               ),
      //           ),
      //           SizedBox(
      //               width: 150,
      //               height: 150,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(15.0),
      //                 child: TextFormField(
      //                   validator: (String? txt){
      //                     if(txt!.isEmpty)
      //                     {
      //                       return 'please enter data';
      //                     }
      //                     return null;
      //                   },
      //                   controller: cvvController,
      //                   keyboardType: TextInputType.number,
      //                   maxLength: 3,
      //                   decoration:  const InputDecoration(
      //                     labelText:  'Cvv' ,
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
            paymentCard(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              const [
                Icon(Icons.check_circle,
                  color: Color(0xffE99000),
                  size: 28,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Save this Card details',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        boardController.animateToPage(0,
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn);
                        index = 0 ;
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xffE9BC6B),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          )
                          ),
                        ),
                        shadowColor: Colors.red
                    ),
                    child: const Text('Back',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn);
                    index =2;
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xffE99000),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          ))
                      ),
                    ),
                    child:  const Text('Next',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget summary() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Summary",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff432267)
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int position) {
                    return Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(top:5,bottom: 5, ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10,),
                              const Text(
                                "Women's Fall Winter Scarf \nAmerican Trends",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600
                                  ,)
                                ,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                  Icon(Icons.star,color: Color(0xffE99000),size: 20,),
                                  Icon(Icons.star_half_rounded,color: Color(0xffE99000),size: 20,),
                                  Text('+23',style: TextStyle(fontSize: 12),),
                                  SizedBox(width: 62,),
                                ],
                              ),
                              //SizedBox(height: 8,),
                            ],
                          ),

                        ],
                      ),
                    );
                  }
              ),
            ),
            Row(
              children: const [
                Text(
                  "Shipping Address",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff432267)
                  ),
                ),
                Spacer(),
                Icon(Icons.check_circle,color: Color(0xffE99000),)
              ],
            ),
            const Text(
              "12, Bay brook, Sharps Rd, Keilor East, Melbourne, Australia",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff432267)
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            InkWell(
                onTap: (){

                },
                child: const Text(
                  "Change",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent
                  ),
                )
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              "Payment",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff432267)
              ),
            ),
            Row(
              children: [
                Image.asset("assets/images/Icon_MasterCard.png",width: size.width * 0.2,height: size.height * 0.05,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Master Card",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff432267)
                      ),
                    ),
                    Text(
                      "**** **** **** 4543",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff432267)
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.check_circle,color: Color(0xffE99000),)
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditCard()));
                },
                child: const Text(
                  "Change",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent
                  ),
                )
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        boardController.animateToPage(0,
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn);
                        index = 1 ;
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xffE9BC6B),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          )
                          ),
                        ),
                        shadowColor: Colors.red
                    ),
                    child: const Text('Back',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn);
                        index =2;
                      });
                    },
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xffE99000),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50
                          ))
                      ),
                    ),
                    child:  const Text('Next',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget paymentCard() {
    return CreditCardForm(
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
      cvvCode: cvv,
      formKey: formKey,
      themeColor: Colors.black87,
      cardNumber: cardNumber,
      onCreditCardModelChange: onCreditCardModelChange,
    );
  }
  Widget textAdd(String t, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: c,
        validator: (String? txt){
          if(txt!.isEmpty)
          {
            return 'please enter data';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration:  InputDecoration(
          labelText:  t ,
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvv = creditCardModel.cvvCode;
    });
  }
}
