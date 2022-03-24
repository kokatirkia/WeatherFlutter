import 'package:json_annotation/json_annotation.dart';
import 'package:weather_flutter/networking/model/main.dart';
import 'package:weather_flutter/networking/model/sys.dart';
import 'package:weather_flutter/networking/model/weather_item.dart';
import 'package:weather_flutter/networking/model/wind.dart';
part 'weather_response.g.dart';

@JsonSerializable()
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

  WeatherResponse(this.dt, this.visibility, this.weather, this.name, this.cod,
      this.main, this.id, this.sys, this.base, this.wind);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
