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
        bottomNavigationBar: BottomAppBar(),
        body: ListView(
          children: [
            Text('안녕'),
            Text('안녕'),
            Text('안녕'),
            Text('안녕'),Text('안녕'),Text('안녕'),
            Text('안녕'),
            Text('안녕'),Text('안녕'),Text('안녕'),Text('안녕'),
            Text('안녕'),Text('안녕'),Text('안녕'),Text('안녕'),Text('안녕'),Text('안녕'),
          ],
        ),
      ),
    );
  }
}

/* stless 누르고 Tab키 누르고 사용 할 이름 추가 */
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 이부분에 함수 작업
    return SizedBox(
        child: Text('안녕')
    );
  }
}
