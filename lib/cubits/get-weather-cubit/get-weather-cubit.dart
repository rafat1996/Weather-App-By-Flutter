import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get-weather-cubit/get-weather-state.dart';
import 'package:weatherapp/models/weather-model.dart';
import 'package:weatherapp/services/weather-services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getWeatherData(cityName: cityName);
      emit(WeatherInfoState());
    } catch (e) {
      emit(WeatherFailureState(error: e.toString()));
    }
  }
}
 