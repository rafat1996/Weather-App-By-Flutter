import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/function/get-theme.dart';
import 'package:weatherapp/models/weather-model.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            getTheme(weatherModel.condition),
                  Colors.white
          ] )
      ),
     
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName.toUpperCase(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Last Update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network('https:${weatherModel.image!}'),
              Text(
                '${weatherModel.temp.round()}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('Max Temp: ${weatherModel.maxTemp.round()}'),
                  Text('Min Temp: ${weatherModel.minTemp.round()}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
