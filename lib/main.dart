import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//메인페이지 세팅
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //위쪽은 기본세팅 같은것
    //코드는 이 아래서부터 작업
    //Flutter 앱 디자인은 위젯 짜집기
    return MaterialApp(
      //home : Text('안녕')
      //home : Icon(Icons.shop)
      //home : Image.asset('thumb6563e826765f1f44e72a16fdb91e7b02.png')
      //home : Container( width: 50, height: 50, color: Colors.amber )
      /*
      home : Center(
        child: Container( width: 100, height: 100, color: Colors.amber ),
      )
       */
      home: Scaffold(
        appBar: AppBar(
          title: Text('앱임')
        ),
        body: Container(
          height: 120,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Expanded(
              child: Row(
                children: [
                  Image.asset('test.png'),
                  Column(
                    children: [
                      Text('캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함)', ),
                      Text('성동구 행당동·끌올 10분 전'),
                      Text('210,000원'),
                      Row(
                        children: [
                          Icon(Icons.favorite),
                          Text('4')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        )
      )
    );
  }
}
