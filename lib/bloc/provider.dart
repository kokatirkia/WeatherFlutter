import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = WeatherBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static WeatherBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}