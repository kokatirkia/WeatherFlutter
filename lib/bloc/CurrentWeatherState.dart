import 'package:weather_flutter/networking/model/weather_response.dart';

class CurrentWeatherState {
  WeatherResponse? weatherResponse;
  bool loading = true;

  CurrentWeatherState(this.loading, [this.weatherResponse]);
}
