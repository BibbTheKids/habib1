import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> fetchJuz(int juzNumber) async {
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/juz/$juzNumber/quran-uthmani'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load juz');
    }
  }

  static Future<Map<String, dynamic>> fetchSurahArabic(int surahNumber) async {
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load surah Arabic');
    }
  }

  static Future<Map<String, dynamic>> fetchSurahEnglish(int surahNumber) async {
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah/$surahNumber/id.indonesian'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load surah English');
    }
  }
}
