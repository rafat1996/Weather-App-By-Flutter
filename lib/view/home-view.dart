import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-state.dart';
import 'package:weatherapp/widget/weather-info-widget.dart';

import '../widget/no-weather-widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'SearchView');
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return  const NoWeatherWidget();
            } else if (state is WeatherInfoState) {
              return  WeatherInfoWidget();
            } else {
              return  const Text('Opps that was error');
            }
          },
        ));
  }
}
