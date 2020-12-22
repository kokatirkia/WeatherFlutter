import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter/bloc/bloc.dart';
import 'package:weather_flutter/bloc/provider.dart';
import 'package:weather_flutter/networking/model/weather_response.dart';

class CurrentWeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.fetchWeather('Tbilisi');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 40),
            Expanded(
              flex: 1,
              child: searchBox(bloc),
            ),
            Expanded(
              flex: 10,
              child: StreamBuilder(
                  stream: bloc.weather,
                  builder: (context, AsyncSnapshot<WeatherResponse> snapshot) {
                    if (snapshot.hasData) {
                      return currentWeather(snapshot, bloc);
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentWeather(
      AsyncSnapshot<WeatherResponse> snapshot, WeatherBloc bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          snapshot.data.name,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${snapshot.data.main.temp.toString()} °C',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Feels like: ${snapshot.data.main.feelsLike} °C',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          snapshot.data.weather[0].description,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Image.network(
          'https://openweathermap.org/img/wn/${snapshot.data.weather[0].icon}.png',
          height: 50,
          width: 50,
        ),
        bottomDetailBox(snapshot),
      ],
    );
  }

  Widget searchBox(WeatherBloc bloc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onSubmitted: (value) {
          bloc.fetchWeather(value);
        },
        style: TextStyle(color: Colors.blueGrey),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget bottomDetailBox(AsyncSnapshot<WeatherResponse> snapshot) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('sunrise'),
                Text(
                    '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.sys.sunrise * 1000))} AM'),
              ],
            ),
            Column(
              children: [
                Text('sunset'),
                Text(
                    '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.sys.sunset * 1000))} PM'),
              ],
            ),
          ],
        ),
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('pressure'),
                Text('${snapshot.data.main.pressure} mBar')
              ],
            ),
            Column(
              children: [
                Text('humidity'),
                Text('${snapshot.data.main.humidity} %')
              ],
            ),
            Column(
              children: [
                Text("wind"),
                Text('${snapshot.data.wind.speed} km/h'),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
