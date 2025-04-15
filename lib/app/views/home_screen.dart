import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بِسْمِ ٱللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00695C),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00695C), Color(0xFF00ACC1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 30,
          itemBuilder: (context, index) {
            int juzNumber = index + 1;
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: Colors.black45,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Get.toNamed(AppRoutes.listJuz, arguments: {'juzNumber': juzNumber});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFF00695C),
                          child: Text(
                            '$juzNumber',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Juz $juzNumber',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
