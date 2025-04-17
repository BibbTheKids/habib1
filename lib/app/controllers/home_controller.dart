import 'package:get/get.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var surahs = [].obs;
  var error = ''.obs;
  var surahsFromJuz = [].obs;
  var ayahsFromSurah = [].obs;

  Future<void> fetchJuzData(int juzNumber) async {
    surahsFromJuz.clear();
    error.value = '';
    try {
      isLoading.value = true;
      final response = await ApiService.fetchJuz(juzNumber);
      final data = response['data'] as Map<String, dynamic>;
      final surahsMap = data['surahs'] as Map<String, dynamic>;
      surahsFromJuz.value = surahsMap.values.toList();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchCombinedSurahData(int surahNumber) async {
    ayahsFromSurah.clear();
    error.value = '';
    try {
      isLoading.value = true;
      final arabicResponse = await ApiService.fetchSurahArabic(surahNumber);
      final englishResponse = await ApiService.fetchSurahEnglish(surahNumber);
      final arabicData = arabicResponse['data'] as Map<String, dynamic>;
      final englishData = englishResponse['data'] as Map<String, dynamic>;
      final List<dynamic> arabicAyahs = arabicData['ayahs'];
      final List<dynamic> englishAyahs = englishData['ayahs'];
      List<Map<String, dynamic>> combinedAyahs = [];
      for (int i = 0; i < arabicAyahs.length; i++) {
        final arabicAyah = arabicAyahs[i] as Map<String, dynamic>;
        final englishAyah = englishAyahs[i] as Map<String, dynamic>;
        combinedAyahs.add({
          'number': arabicAyah['number'],
          'arabicText': arabicAyah['text'],
          'englishText': englishAyah['text'],
          'numberInSurah': arabicAyah['numberInSurah'],
          'juz': arabicAyah['juz'],
          'manzil': arabicAyah['manzil'],
          'page': arabicAyah['page'],
          'ruku': arabicAyah['ruku'],
          'hizbQuarter': arabicAyah['hizbQuarter'],
          'sajda': arabicAyah['sajda'],
          'audio': arabicAyah['audio'],
          'audioSecondary': arabicAyah['audioSecondary'],
        });
      }
      ayahsFromSurah.value = combinedAyahs;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

}