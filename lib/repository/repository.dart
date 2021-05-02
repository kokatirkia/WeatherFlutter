import 'package:chopper/chopper.dart';
import 'package:weather_flutter/networking/api.dart';

class Repository {
  static const units = "metric";
  static const appid = "64d498c46d9473b333472889203dac1d";

  Api api = Api.create();

  Future<Response> fetchWeather(String city) async {
    return api.fetchWeather(city, units, appid);
  }
}
