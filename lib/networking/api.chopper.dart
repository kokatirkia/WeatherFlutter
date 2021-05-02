// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$Api extends Api {
  _$Api([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = Api;

  Future<Response> fetchWeather(dynamic city, dynamic units, dynamic appid) {
    final $url = 'weather';
    final Map<String, dynamic> $params = {
      'q': city,
      'units': units,
      'appid': appid
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
