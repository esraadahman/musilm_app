import 'package:http/http.dart' as http;
import 'dart:convert';

class quran_model {
// get Quran list
  static Future<List<dynamic>> getQuranList() async {
    final response =
        await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      //  final List<dynamic> quranList = [];
      print(data);
      final List<dynamic> quranList = data["data"] as List<dynamic>;
      // for (int i = 0; i < data.length; i++) {
      //   quranList.add({
      //     'id': data[i]['number'],
      //     'name': data[i]['name'],
      //     'englishName': data[i]['englishName'],
      //     'englishNameTranslation': data[i]['englishNameTranslation'],
      //     'revelationType': data[i]['revelationType'],
      //     'numberOfAyahs': data[i]['numberOfAyahs'],
      //   });
      // }
      print(quranList);
      return quranList;
    } else {
      throw Exception('Failed to load Quran list');
    }
  }

// get Surah
  static Future<List<dynamic>> getSurah(int id) async {
    final response = await http
        .get(Uri.parse('https://api.alquran.cloud/v1/surah/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      List<dynamic> surah = data['data']['ayahs'] as List<dynamic>;
      print(surah);
      return surah;
    } else {
      throw Exception('Failed to load Surah');
    }
  }
}
