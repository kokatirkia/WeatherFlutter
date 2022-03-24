import 'package:json_annotation/json_annotation.dart';
part 'main.g.dart';

@JsonSerializable()
class Main {
  double temp;
  @JsonKey(name: 'temp_min')
  double tempMin;
  int humidity;
  int pressure;
  @JsonKey(name: 'temp_max')
  double tempMax;
  @JsonKey(name: 'feels_like')
  double feelsLike;


  Main(this.temp, this.tempMin, this.humidity, this.pressure, this.tempMax,
      this.feelsLike);

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}