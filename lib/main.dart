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
      home: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavi(),
        body: ListView(
          children: [
            ListItem(),
            ListItem(),
            ListItem()
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.account_circle, size: 36,),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('홍길동'),
        )
      ],
    );
  }
}


class BottomNavi extends StatelessWidget {
  const BottomNavi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BottomAppBar(
          child: SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Icon(Icons.phone),
                      Icon(Icons.message),
                      Icon(Icons.contact_page)
                  ],
              )
          )
      );
  }
}
