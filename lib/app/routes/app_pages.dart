import 'package:get/get.dart';
import '../bindings/splash_binding.dart';
import '../bindings/home_binding.dart';
import '../views/splash_screen.dart';
import '../views/home_screen.dart';
import '../views/list_juz_screen.dart';
import '../views/surah_detail_screen.dart';
import 'app_routes.dart';

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
  ];
}
