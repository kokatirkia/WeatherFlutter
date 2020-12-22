class Wind {
  int deg;
  double speed;

  Wind(parsedJson) {
    deg = parsedJson['deg'];
    speed = parsedJson['speed'].toDouble();
  }
}