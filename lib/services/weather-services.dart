import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/constant/url.dart';
import 'package:weatherapp/models/weather-model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices(this.dio);

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops that was Error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops that was Error, try later');
    }
  }
}
