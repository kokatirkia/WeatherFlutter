class WeatherItem{
  String icon;
  String description;
  String main;
  int id;

  WeatherItem(parsedJson) {
    icon = parsedJson['icon'];
    description = parsedJson['description'];
    main = parsedJson['main'];
    id = parsedJson['id'];
  }
}