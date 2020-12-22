import 'package:http/http.dart';
import 'package:weather_flutter/networking/api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<Response> fetchLondonWeather(String city) =>
      appApiProvider.fetchLondonWeather(city);
}
