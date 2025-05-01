import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../bindings/splash_binding.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../views/home_screen.dart';
import '../views/list_juz_screen.dart';
import '../views/splash_screen.dart';
import '../views/surah_detail_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.listJuz,
      page: () => ListJuzScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.listSurah,
      page: () => SurahDetailScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
  ];
}
