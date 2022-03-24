import 'package:json_annotation/json_annotation.dart';
part 'weather_item.g.dart';

@JsonSerializable()
class WeatherItem{
  String icon;
  String description;
  String main;
  int id;


  WeatherItem(this.icon, this.description, this.main, this.id);

  factory WeatherItem.fromJson(Map<String, dynamic> json) => _$WeatherItemFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherItemToJson(this);
}