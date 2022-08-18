import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasks/HomeScreen&Drawer/List%20Of%20Drawer/Profile%20Screen.dart';

import '../../models/usermodel.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  {
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
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var homeController = TextEditingController();
  var locationController = TextEditingController();
  var phoneController = TextEditingController();
  File? image ;
  Future pickImage() async
  {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp ;
      });
    } on PlatformException catch(e)
    {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }
  Future pickImageC() async
  {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp ;
      });
    } on PlatformException catch(e)
    {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff432267),
      appBar: AppBar(
        elevation: 0,
        title:  Text(
            'Edit Your Profile',
          style: GoogleFonts.josefinSans(
            textStyle : const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff432267),
        actions: [TextButton(onPressed: (){Navigator.pop(context);}, child:  Text(
          'Cancel',
          style: GoogleFonts.josefinSans(
            textStyle : const TextStyle(
              fontSize: 20,
              color:  Color(0xffE99000),
              fontWeight: FontWeight.w600,
            ),),
        )
        )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: const Color(0xffE99000),
                      child: CircleAvatar(
                          radius: 60,
                          child: image != null ? ClipOval(
                            child: Image.file(image!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ) : Text('Image',
                          style: GoogleFonts.josefinSans(
                            textStyle : const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          )
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        pickImage();
                      },
                      icon: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xffE99000),
                          child: SvgPicture.asset('assets/images/Group 387.svg')
                      ),
                    ),
                  ],
                ),
              ),
            ),
            edit(data.name.toString(), 'assets/images/path-5.png',usernameController,TextInputType.text),
            edit(data.email.toString(), 'assets/images/path-4.png',emailController,TextInputType.emailAddress),
            edit('Arish - North Sinai', 'assets/images/path-3.png',homeController,TextInputType.streetAddress),
            edit('Al Sagha Street', 'assets/images/path-2.png',locationController,TextInputType.emailAddress),
            edit('+201559201810', 'assets/images/path-1.png',phoneController,TextInputType.phone),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomSheet:  Container(
        color: const Color(0xff432267),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: size.height * 0.08,
          decoration: const BoxDecoration(
            color:  Color(0xffE99000),
            borderRadius:  BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: MaterialButton(
            onPressed: (){
              setState(() {
                updateProfile(emailController.text,usernameController.text,image.toString());
              });
            },
            child: Text('Save',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                textStyle:const TextStyle(
                  fontSize: 35,
                  color: Color(0xff432267),
                  fontWeight: FontWeight.w600,
                ),),
              ),
            ),
          ),
        ),
      ) ;
  }

  Widget edit(String txt , String icon,TextEditingController controller,TextInputType key)
  {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children:
          [
            Container(
              width: 300,
              height: 60,
              padding: const EdgeInsets.only(left: 50),
              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),topRight: Radius.circular(10)),

                ),
                child: Center(
                  child: TextFormField(
                    style: GoogleFonts.josefinSans(
                      textStyle:const TextStyle(
                        fontSize: 18,
                        color: Color(0xff432267),
                        fontWeight: FontWeight.w600,
                      ),),
                    keyboardType: key,
                    controller: controller,
                    cursorColor: const Color(0xff432267),
                    decoration:  InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),topRight: Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xffE99000))
                      ),
                        focusedBorder: const OutlineInputBorder(
                         borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),topRight: Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xffE99000))
                      ),
                      labelText: txt,
                      labelStyle: GoogleFonts.josefinSans(
                        textStyle:const TextStyle(
                          fontSize: 18,
                          color:  Color(0xff432267),
                          fontWeight: FontWeight.w600,
                        ),),
                         hintText : txt,
                      hintStyle: GoogleFonts.josefinSans(
                        textStyle:const TextStyle(
                          fontSize: 18,
                          color:  Color(0xff432267),
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                color: const Color(0xffE99000),
                child:  ImageIcon(
                  AssetImage(icon),
                  size: 30,
                ),
              ),
            ),
         ],
        )
    );

  }

  void updateProfile(String email  , String name , String image ) async {
    FirebaseFirestore.instance.collection('users').doc(user!.uid)
        .update({
      'name' : name,
      'email' : email,
      'image' : image,
    }).then((value)
    {
      Fluttertoast.showToast(
          msg: "Update profile Successful",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 20.0
      );
      if (kDebugMode) {
        print(emailController.text);
      }
      if (kDebugMode) {
        print(usernameController.text);
      }
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

}
