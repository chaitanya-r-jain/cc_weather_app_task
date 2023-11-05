import 'package:http/http.dart';
import 'dart:convert';

class GetData {
  String weather = '';
  String temp = '';
  String tempMin = '';
  String tempMax = '';

  GetData() {
    getCurrentData();
  }

  Future<void> getCurrentData() async {
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=28.3688&lon=75.5830&appid=1e85a6abfe6246192842719f1b85e350'),
    );

    Map data = jsonDecode(response.body);

    temp = (data['main']['temp']-273.15).toString();
    weather = data['weather'][0]['main'];
    tempMin = ((data['main']['temp_min']-273.15).toString().substring(0,2));
    tempMax = ((data['main']['temp_max']-273.15).toString().substring(0,2));


  }
}


void main() async {
  GetData weatherData = GetData();
  await Future.delayed(const Duration(seconds: 5));
  print(weatherData);
  print('hello world');
}