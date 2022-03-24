import 'package:chopper/chopper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_flutter/bloc/CurrentWeatherState.dart';
import 'package:weather_flutter/networking/model/weather_response.dart';
import 'package:weather_flutter/repository/repository.dart';

class WeatherBloc {
  Repository _repository = Repository();

  final _currentWeatherState = BehaviorSubject<CurrentWeatherState>();

  Stream<CurrentWeatherState> get weather => _currentWeatherState.stream;

  fetchWeather(String city) async {
    _currentWeatherState.sink.add(CurrentWeatherState(true));

    Response response = await _repository.fetchWeather(city);
    if (response.statusCode == 200) {
      _currentWeatherState.sink.add(
          CurrentWeatherState(false, WeatherResponse.fromJson(response.body)));
    } else {
      _currentWeatherState.sink.addError("Error");
    }
  }

  dispose() {
    _currentWeatherState.close();
  }
}
