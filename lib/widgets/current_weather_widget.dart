import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //getting and diplaying temperature
        temperatureAreaWidget(),
        //more details - windspeed, humidity, clouds
        currentWeatherMoreDetails(),
      ],
    );
  }

  Widget temperatureAreaWidget()
  {
    return Row(
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png"
        ),

      ],
    );
  }

  Widget currentWeatherMoreDetails()
  {
    return Container();
  }
}
