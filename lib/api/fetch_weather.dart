import 'dart:convert';

import 'package:weatherapp_starter_project/api/api_key.dart';
import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data_current.dart';

import '../utils/api_url.dart';
class FetchWeatherAPI{
  WeatherData? weatherData;
  //proccessing data from response APi to json

  Future<WeatherData> processData(lat,lon) async
  {
    var response = await http.get(Uri.parse(apiUrl(lat,lon)));
    var jsonString = jsonDecode(response.body); //converting response api json to json string
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

