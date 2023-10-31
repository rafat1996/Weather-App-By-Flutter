import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather-model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'baab2d8368e74e75aa894858232510';
  Future<WeatherModel> getWeather({required String cityName}) async {
    
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}
