import 'package:weather_flutter/networking/model/main.dart';
import 'package:weather_flutter/networking/model/sys.dart';
import 'package:weather_flutter/networking/model/weather_item.dart';
import 'package:weather_flutter/networking/model/wind.dart';

class WeatherResponse {
  int dt;
  int visibility;
  List<WeatherItem> weather;
  String name;
  int cod;
  Main main;
  int id;
  Sys sys;
  String base;
  Wind wind;

  WeatherResponse.fromJson(Map<String, dynamic> parsedJson) {
    dt = parsedJson['dt'];
    visibility = parsedJson['visibility'];
    List<WeatherItem> weatherList = [];
    for (int i = 0; i < parsedJson['weather'].length; i++) {
      WeatherItem result = WeatherItem(parsedJson['weather'][i]);
      weatherList.add(result);
    }
    weather = weatherList;
    name = parsedJson['name'];
    cod = parsedJson['cod'];
    main = Main(parsedJson['main']);
    id = parsedJson['id'];
    sys = Sys(parsedJson['sys']);
    base = parsedJson['base'];
    wind = Wind(parsedJson['wind']);
  }
}
