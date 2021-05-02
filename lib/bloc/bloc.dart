import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_flutter/networking/model/weather_response.dart';
import 'package:weather_flutter/repository/repository.dart';

class WeatherBloc {
  Repository _repository = Repository();

  final _weatherFetcher = BehaviorSubject<WeatherResponse>();

  Observable<WeatherResponse> get weather => _weatherFetcher.stream;

  fetchWeather(String city) async {
    Response response = await _repository.fetchWeather(city);
    if (response.statusCode == 200) {
      _weatherFetcher.sink.add(WeatherResponse.fromJson(json.decode(response.bodyString)));
    } else {
      _weatherFetcher.sink.addError("Error");
    }
  }

  dispose() {
    _weatherFetcher.close();
  }
}
