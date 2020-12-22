class Sys{
  String country;
  int sunrise;
  int sunset;
  int id;
  int type;
  double message;

  Sys(parsedJson) {
    country = parsedJson['country'];
    sunrise = parsedJson['sunrise'];
    sunset = parsedJson['sunset'];
    id = parsedJson['id'];
    type = parsedJson['type'];
    message = parsedJson['message'];
  }
}