import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';
import 'package:tasks/provdier/products.dart';
import 'OnBoardingScreen&Login&SignUp/OnBoarding/OnBoardingPages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final sharedPreferences = await SharedPreferences.getInstance();
  dynamic email = sharedPreferences.getString('email');
  if (kDebugMode) {
    print("The Value Of The Email : $email");
  }
  Widget? nav;
  if(email == null){
    nav = const OnBoarding();
    if(kDebugMode){
      print(kDebugMode);
      print("Login Screen");
    }
  }else{
    nav = const ZoomDrawers();
    if(kDebugMode){
      print(kDebugMode);
      print("HomePage");
    }
  }
  runApp(MyApp(startScreen: nav,));
} // run my app

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  const MyApp({Key? key, required this.startScreen}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
      [
        ChangeNotifierProvider(create: (context) => ProviderData()),
      ],
      child: MaterialApp(
        title: "Go Shop",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startScreen,
      ),
    );
  }
} // my app



