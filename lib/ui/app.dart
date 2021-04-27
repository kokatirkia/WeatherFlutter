import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/bloc/bloc.dart';

import 'current_weather/current_weather.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => WeatherBloc(),
      dispose: (_, WeatherBloc bloc) => bloc.dispose(),
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
