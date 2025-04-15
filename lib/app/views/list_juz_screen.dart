import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';

class ListJuzScreen extends StatefulWidget {
  @override
  _ListJuzScreenState createState() => _ListJuzScreenState();
}

class _ListJuzScreenState extends State<ListJuzScreen> with AutomaticKeepAliveClientMixin {
  late final HomeController homeController;
  late final int juzNumber;

  @override
  void initState() {
    super.initState();
    homeController = Get.find<HomeController>();
    juzNumber = Get.arguments['juzNumber'] ?? 1;
    homeController.fetchJuzData(juzNumber);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juz $juzNumber',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00695C),
        elevation: 0,
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (homeController.error.isNotEmpty) {
          return Center(child: Text(homeController.error.value, style: TextStyle(color: Colors.red)));
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: homeController.surahs.length,
          itemBuilder: (context, index) {
            final surah = homeController.surahs[index] as Map<String, dynamic>;
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: Colors.black45,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Get.toNamed(AppRoutes.listSurah, arguments: {'surahNumber': surah['number']}),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFF00695C),
                          child: Text(
                            surah['number'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                surah['englishName'] ?? '',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                surah['name'] ?? '',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black54),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}