class Main {
  double temp;
  double tempMin;
  int humidity;
  int pressure;
  double tempMax;
  double feelsLike;

  Main(parsedJson) {
    temp = parsedJson['temp'].toDouble();
    tempMin = parsedJson['temp_min'].toDouble();
    humidity = parsedJson['humidity'];
    pressure = parsedJson['pressure'];
    tempMax = parsedJson['temp_max'].toDouble();
    feelsLike = parsedJson['feels_like'].toDouble();
  }
}