import 'package:flutter/material.dart';

Color getTheme(String? condition) {
  if (condition == 'Clear' || condition == 'Light Cloud') {
    return Colors.orange;
  } else if (condition == 'Sleet' ||
      condition == 'Snow' ||
      condition == 'Hail' ||
      condition == 'Light Rain' ||
      condition == 'Heavy Rain' ||
      condition == 'Patchy rain possible' ||
      condition == 'Showers' ||
      condition == 'Mist' ||
      condition == 'Overcast') {
    return Colors.blue;
  } else if (condition == 'Heavy Cloud' || condition == 'Heavy snow') {
    return Colors.blueGrey;
  } else if (condition == 'Thunderstorm' || condition == 'Thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
