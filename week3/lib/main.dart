import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Pretendard"
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "GDSC 모바일 스터디",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          shape: Border(
            bottom: BorderSide(
            color: Colors.black12,
        )
        ),
        ),// Row1
        body:Center(
          child: Column(
            children: [
              Container(
                width: 700,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child:Text(
                  "과제",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),// Text1
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 700,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          //width: 200,
                          //height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black12,
                              )
                          ),
                          child: const Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "오늘의 과제",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.book,
                                size: 70,
                              ),
                            ],
                          ),
                        ),// 오늘의 과제
                        Container(
                          //width: 200,
                          //height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black12,
                              )
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "수행한 과제",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.collections_bookmark,
                                size: 70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),// Row 2-1
              Container(
                width: 700,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child:Text(
                  "나의 수행도",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),// Text1
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              Container(
                width: 700,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child:Text(
                  "나의 다짐",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),// Text1
              ),
              Container(
                width: 700,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child:Text(
                  "과제를 모두 죽이겠다. 그르르르",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),// Text1
              ),
              // 다른 Row들을 추가할 수 있습니다.
            ],
          ),
        )
      ),
    );
  }
}
