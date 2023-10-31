import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/models/weather-model.dart';
import 'package:weatherapp/provider/weather-provider.dart';
import 'package:weatherapp/services/weather-service.dart';

class SearchView extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();

              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: 'Enter a City',
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
          ),
        ),
      ),
    );
  }
}
