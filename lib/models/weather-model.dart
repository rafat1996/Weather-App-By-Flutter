import 'package:flutter/material.dart';

class WeatherModel {
  String localtime;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;

  WeatherModel(
      {required this.localtime,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        localtime: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        condition: jsonData['condition']['text']);
  }
  String getImage() {
    if (condition == 'Clear' || condition == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail'||condition == 'Mist') {
      return 'assets/images/snow.png';
    } else if (condition == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Light Rain' ||
        condition == 'Heavy Rain' ||
        condition == 'Patchy rain possible' ||
        condition == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thunderstorm' || condition == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getTheme() {
    if (condition == 'Clear' || condition == 'Light Cloud') {
      return Colors.orange;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail' ||
        condition == 'Light Rain' ||
        condition == 'Heavy Rain' ||
        condition == 'Patchy rain possible' ||
        condition == 'Showers'||condition == 'Mist') {
      return Colors.blue;
    } else if (condition == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (condition == 'Thunderstorm' || condition == 'Thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
