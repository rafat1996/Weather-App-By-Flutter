import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/constant/route.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-state.dart';
import 'package:weatherapp/function/get-theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.condition ==
                        null
                    ? const AppBarTheme(backgroundColor: Colors.blue)
                    : AppBarTheme(
                        backgroundColor: getTheme(
                            BlocProvider.of<GetWeatherCubit>(context)
                                .weatherModel
                                ?.condition)),
             
              ),
              debugShowCheckedModeBanner: false,
              routes: routes,
            );
          },
        ),
      ),
    );
  }
}


