import 'package:get/get.dart';
import 'dart:async';

import 'package:quranapp/app/routes/app_pages.dart';
// import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
