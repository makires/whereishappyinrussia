import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:test_backend_on_flask/model/model_city.dart';
import 'package:test_backend_on_flask/helpers/network_utility.dart';

class CustomModelCity {
  String nameCity;
  String population;
  String subject;
  CustomModelCity({
    required this.nameCity,
    required this.population,
    required this.subject,
  });
}

class ViewModel extends ChangeNotifier {
  List<CustomModelCity> customCities = [];

  void getDataAboutCity({
    required String cityName,
    required BuildContext context,
  }) async {
    if (cityName.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Упс...'),
              content: const Text('Кажется вы не ввели название города'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ],
              elevation: 24.0,
            );
          });
    } else {
      final noWhiteSpaceCity = cityName.replaceAll(' ', '');
      final jsonString =
          await NetworkUtility.featchData(forCity: noWhiteSpaceCity);
      if (jsonString == 'error') {
        return;
      }
      // MARK: for my article
      // в данном контексте лучше использовать
      // json_annotation package with json_serializable package
      // to generate the code to convert json to dart objects for you,
      // this will help you to avoid this kind of issues
      // Expected a value of type 'List<Map<String, dynamic>>', but got one of type 'List<dynamic>'
      // and make your code more readable
      final jsonList = jsonDecode(jsonString);
      if (jsonList.every((e) => e is Map)) {
        List<Map<String, dynamic>> mapList =
            jsonList.cast<Map<String, dynamic>>();
        List<ModelCity> cities =
            mapList.map((e) => ModelCity.fromJson(e)).toList();

        var formatter = NumberFormat.decimalPattern("ru_RU");
        customCities = cities
            .map(
              (e) => CustomModelCity(
                  nameCity: e.name,
                  population: formatter.format(e.population).toString(),
                  subject: e.subject),
            )
            .toList();
        notifyListeners();
      }
    }
  }
}
