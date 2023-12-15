class WeatherModel {
  final String cityName;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String condition;
  final String? image;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.condition,
      this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
