import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quranapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  @override
  void  onReady() {
    super.onReady();
    checkLogin();
  }

  void checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool('isLogged') ?? false;

    if (isLogged) {
      Get.offAllNamed(Routes.home);
    }
  }

  signWithGoogle() async{
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null) {
        print('Login Dibatalkan');
      }

      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);

      Get.offAllNamed(Routes.home);
    } catch(e) {
      print(e);
    }
  }
}
