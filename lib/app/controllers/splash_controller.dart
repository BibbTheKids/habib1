import 'package:get/get.dart';
import 'dart:async';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
