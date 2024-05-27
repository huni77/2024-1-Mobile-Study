import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

String apikey = "c15237facabcb6fea295b0efbfd6cc45";
String cityName = "kor";
String apiCall = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey";
final dio = Dio();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String weatherInfo = "기온 : No Data~\n"
      "습도 : No Data~\n"
      "기압 : No Data~\n"
      "풍속 : No Data~";

  void getWeatherInfo() async {
    try {
      Response response = await dio.get(apiCall);
      setState(() {
        weatherInfo = "기온 : ${response.data['main']['temp']} \n"
            "습도 : ${response.data['main']['humidity']} \n"
            "기압 : ${response.data['main']['pressure']} \n"
            "풍속 : ${response.data['wind']['speed']}";
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
