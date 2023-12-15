class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherInfoState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState({required this.error});
}
