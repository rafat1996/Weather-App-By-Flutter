import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather-model.dart';
import 'package:weatherapp/provider/weather-provider.dart';
import 'package:weatherapp/views/search-view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchView();
                  }),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'There is no Weather',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Searching Now 🔎',
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    weatherData.getTheme(),
                    weatherData.getTheme()[50]!,
                    weatherData.getTheme()[100]!,
                  ])),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context)
                          .cityName!
                          .toUpperCase(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Update: ${weatherData.localtime}',
                      style: const TextStyle(fontSize: 21),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(weatherData.getImage()),
                        Text(
                          weatherData.temp.toInt().toString(),
                          style: const TextStyle(fontSize: 38),
                        ),
                        Column(
                          children: [
                            Text(
                              'max: ${weatherData.maxTemp.toInt()}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              'min: ${weatherData.minTemp.toInt()}',
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData.condition,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ]),
            ),
    );
  }
}
