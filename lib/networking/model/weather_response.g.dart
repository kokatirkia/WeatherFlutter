// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    json['dt'] as int,
    json['visibility'] as int,
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['name'] as String,
    json['cod'] as int,
    Main.fromJson(json['main'] as Map<String, dynamic>),
    json['id'] as int,
    Sys.fromJson(json['sys'] as Map<String, dynamic>),
    json['base'] as String,
    Wind.fromJson(json['wind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'visibility': instance.visibility,
      'weather': instance.weather,
      'name': instance.name,
      'cod': instance.cod,
      'main': instance.main,
      'id': instance.id,
      'sys': instance.sys,
      'base': instance.base,
      'wind': instance.wind,
    };
