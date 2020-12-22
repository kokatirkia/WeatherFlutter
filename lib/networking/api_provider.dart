import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();

  Future<Response> fetchLondonWeather(String city) async {
    Response response = await client.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=64d498c46d9473b333472889203dac1d");
    return response;
  }
}
