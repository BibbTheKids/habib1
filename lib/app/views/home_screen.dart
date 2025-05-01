import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
// import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snaphot.hasError) {
          return Center(
            child: Text("${snaphot.error}"),
          );
        } else if (snaphot.hasData) {
          return Column(
            children: [
              UserAccountsDrawerHeader(accountName: Text(user?.displayName ?? 'user'), accountEmail: Text(user?.email ?? 'No Email'))
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            homeController.logout();
          }, icon: Icon(Icons.logout))
        ],
        title: Text(
          'Al-Quran',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00695C),
        elevation: 0,
      ),
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snaphot) {
        if(snaphot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snaphot.hasError){
          return Center(
            child: Text("${snaphot.error}"),
          );
        } else if (snaphot.hasData){
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00695C), Color(0xFF00ACC1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:
            ListView.builder(
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
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/image/list.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$juzNumber',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // pastikan kontras dengan gambar
                                ),
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
          );
        } else {
          return Center(
          child: CircularProgressIndicator(),
          );
    }
      }
    ),);
  }
}
