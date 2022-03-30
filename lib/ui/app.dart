import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/bloc/bloc.dart';
import 'package:weather_flutter/ui/theme/AppTheme.dart';

import 'current_weather/current_weather.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => WeatherBloc(),
      dispose: (_, WeatherBloc bloc) => bloc.dispose(),
      child: MaterialApp(
        theme: AppThemeData.theme,
        home: CurrentWeatherScreen(),
      ),
    );
  }
}
