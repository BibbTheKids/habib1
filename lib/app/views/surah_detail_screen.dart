import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import '../controllers/home_controller.dart';

class SurahDetailScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String url) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final int surahNumber = Get.arguments['surahNumber'] ?? 1;
    
    // Mengambil data setelah widget selesai build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.fetchCombinedSurahData(surahNumber);
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Surah $surahNumber',
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
            final ayah = homeController.surahs[index] as Map<String, dynamic>;
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: Colors.black45,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF00695C),
                        child: Text(
                          ayah['numberInSurah'].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              ayah['arabicText'] ?? '',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 8),
                            Text(
                              ayah['englishText'] ?? '',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.play_arrow, color: Color(0xFF00695C)),
                        onPressed: () {
                          _playAudio(ayah['audio'] ?? '');
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
