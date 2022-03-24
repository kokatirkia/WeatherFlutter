// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherItem _$WeatherItemFromJson(Map<String, dynamic> json) {
  return WeatherItem(
    json['icon'] as String,
    json['description'] as String,
    json['main'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$WeatherItemToJson(WeatherItem instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
      'main': instance.main,
      'id': instance.id,
    };
