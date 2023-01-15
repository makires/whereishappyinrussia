import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'package:dio/dio.dart';

class NetworkUtility {
  static Future<String> featchData({required String forCity}) async {
    // for Android emulator when server is Localhost for DEBUG

    // final response = await http.get(Uri.parse(
    //     'http://10.0.2.2:5051/search?cityName=$cityForRequest'));

    // var dio = Dio();
    // var response2 = await dio.get(
    //     'https://wherehappyinrussia.pythonanywhere.com/search?cityName=$forCity');
    // if (response2.statusCode == 200) {
    //   return response2.data.toString();
    // } else {
    //   return 'error';
    // }
    final response = await http.get(Uri.parse(
        'https://wherehappyinrussia.pythonanywhere.com/search?cityName=$forCity'));
    // 'http://127.0.0.1:5000/search?cityName=$forCity'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'error';
    }
  }

  static showLink(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link), mode: LaunchMode.platformDefault);
    }
  }
}
