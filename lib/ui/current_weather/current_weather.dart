import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/bloc/CurrentWeatherState.dart';
import 'package:weather_flutter/bloc/bloc.dart';
import 'package:weather_flutter/networking/model/weather_response.dart';

class CurrentWeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WeatherBloc>(context);
    bloc.fetchWeather('Tbilisi');

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              searchBox(bloc),
              weatherInfo(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBox(WeatherBloc bloc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(32),
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

  Widget weatherInfo(WeatherBloc bloc) {
    return Expanded(
      child: StreamBuilder(
          stream: bloc.weather,
          builder: (context, AsyncSnapshot<CurrentWeatherState> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return currentWeather(snapshot.data!.weatherResponse!, bloc);
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget currentWeather(WeatherResponse weatherResponse, WeatherBloc bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          weatherResponse.name,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${weatherResponse.main.temp.toString()} °C',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Feels like: ${weatherResponse.main.feelsLike} °C',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          weatherResponse.weather[0].description,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Image.network(
          'https://openweathermap.org/img/wn/${weatherResponse.weather[0].icon}.png',
          height: 50,
          width: 50,
        ),
        bottomDetailBox(weatherResponse),
      ],
    );
  }

  Widget bottomDetailBox(WeatherResponse weatherResponse) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/sunrise.png",
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Text('sunrise'),
                  Text(
                      '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(weatherResponse.sys.sunrise * 1000))} AM'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/sunset.png",
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Text('sunset'),
                  Text(
                      '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(weatherResponse.sys.sunset * 1000))} PM'),
                ],
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/pressure.png",
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Text('pressure'),
                  Text('${weatherResponse.main.pressure} mBar')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/humidity.png",
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Text('humidity'),
                  Text('${weatherResponse.main.humidity} %')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/wind.png",
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                  Text("wind"),
                  Text('${weatherResponse.wind.speed} km/h'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
