import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//메인페이지 세팅
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var a = 1;

  @override
  Widget build(BuildContext context) {

    //위쪽은 기본세팅 같은것
    //코드는 이 아래서부터 작업
    //Flutter 앱 디자인은 위젯 짜집기
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            a++;
            print(a);
          },
        ),
        appBar: AppBar(),
        bottomNavigationBar: BottomNavi(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              print(index);
              return ListTile(
                leading: Icon(Icons.account_circle, size: 36,),
                title: Text('홍길동')
              );
            }
        ),
      ),
    );
  }
}

/// 과제 - 리스트 뿌리는 부분
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
