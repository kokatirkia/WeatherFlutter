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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            searchBox(bloc),
            weatherInfo(bloc),
          ],
        ),
      ),
    );
  }

  Widget searchBox(WeatherBloc bloc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
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
    return StreamBuilder(
        stream: bloc.weather,
        builder: (context, AsyncSnapshot<CurrentWeatherState> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.loading) {
              return progressBar();
            } else if (snapshot.data!.weatherResponse != null) {
              return mainInfo(snapshot.data!.weatherResponse!, bloc);
            }
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return progressBar();
        });
  }

  Widget progressBar() {
    return Expanded(child: Center(child: CircularProgressIndicator()));
  }

  Widget mainInfo(WeatherResponse weatherResponse, WeatherBloc bloc) {
    return Expanded(
      child: Column(
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
      ),
    );
  }

  Widget bottomDetailBox(WeatherResponse weatherResponse) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxItem("assets/sunrise.png", 'sunrise',
                  '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(weatherResponse.sys.sunrise * 1000))} AM'),
              boxItem("assets/sunset.png", 'sunset',
                  '${DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(weatherResponse.sys.sunset * 1000))} AM'),
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxItem("assets/pressure.png", 'pressure',
                  '${weatherResponse.main.pressure} mBar'),
              boxItem("assets/humidity.png", 'humidity',
                  '${weatherResponse.main.humidity} %'),
              boxItem("assets/wind.png", 'wind',
                  '${weatherResponse.wind.speed} km/h'),
            ],
          ),
        ],
      ),
    );
  }

  Widget boxItem(String imageSrc, String name, String value) {
    return Column(
      children: [
        Image.asset(
          imageSrc,
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
        Text(name),
        Text(value),
      ],
    );
  }
}
