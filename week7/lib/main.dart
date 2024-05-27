import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'model.dart';
import 'service.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Dio();
String apikey = "c15237facabcb6fea295b0efbfd6cc45";
String cityName = "kor";
String apiCall = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String weatherInfo =
      "기온 : No Data~\n"
      "습도 : No Data~\n"
      "기압 : No Data~\n"
      "풍속 : No Data~\n"
      "날씨 상태 : No Data~";

  void getWeatherInfo() async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());

    Model model = await WeatherService(dio).getWeather(cityName, apikey);
    //Model model = await WeatherService(Dio()).getWeather(cityName, apikey);
    try {
      setState(() {
        weatherInfo =
            "기온 : ${model.main.temp}\n"
            "습도 : ${model.main.humidity}\n"
            "기압 : ${model.main.pressure}\n"
            "풍속 : ${model.wind.speed}\n"
            "날씨 상태 : ${model.weather.first.description}";
      });
    } catch (e) {
      setState(() {
        weatherInfo = "날씨 정보를 불러올 수 없습니다.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GDSC 모바일 스터디"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: getWeatherInfo,
                child: Text("날씨 API 받기!!"),
              ),
              Text(weatherInfo),
            ],
          ),
        ),
      ),
    );
  }
}
