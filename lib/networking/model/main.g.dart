// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    (json['temp'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
    json['humidity'] as int,
    json['pressure'] as int,
    (json['temp_max'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'temp_max': instance.tempMax,
      'feels_like': instance.feelsLike,
    };
