import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
// import 'app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = prefs.getBool('isLogged') ?? false;
  runApp(GetMaterialApp(
    title: 'My Flutter App',
    debugShowCheckedModeBanner: false,
    initialRoute: isLogged ? AppRoutes.home :  AppRoutes.LOGIN_SCREEN,
    getPages: AppPages.pages,
  )
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'My Flutter App',
//       debugShowCheckedModeBanner: false,
//       initialRoute: isLogged ? AppRoutes.home :  AppRoutes.LOGIN_SCREEN,
//       getPages: AppPages.pages,
//     );
//   }
// }
