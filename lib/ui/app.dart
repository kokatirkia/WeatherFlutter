import 'package:flutter/material.dart';
import 'package:weather_flutter/bloc/provider.dart';

import 'current_weather/current_weather.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF546e7a),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CurrentWeatherScreen(),
      ),
    );
  }
}
