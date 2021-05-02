import 'package:chopper/chopper.dart';

part 'api.chopper.dart';

@ChopperApi()
abstract class Api extends ChopperService {
  @Get(path: "weather")
  Future<Response> fetchWeather(
      @Query("q") city, @Query("units") units, @Query("appid") appid);

  static Api create() {
    final client = ChopperClient(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      services: [
        _$Api(),
      ],
      converter: JsonConverter(),
    );
    return _$Api(client);
  }
}
