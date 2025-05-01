import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Al-Quran", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF00695C)),),
          Image.asset("assets/image/icon.png", height: 150,),
          ElevatedButton(onPressed: () => controller.signWithGoogle(), child: Text("Login Google"))
        ]
      )
      )
    );
  }
}
