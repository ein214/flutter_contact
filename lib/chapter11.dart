import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}


//메인페이지 세팅
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['고은지', '정수연', '곽청'];
  var like = [0, 0, 0];

  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {

    //위쪽은 기본세팅 같은것
    //코드는 이 아래서부터 작업
    //Flutter 앱 디자인은 위젯 짜집기
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            //print(context.findAncestorWidgetOfExactType<MaterialApp>());
            showDialog(context: context, builder: (context) {
                return DialogUI( addOne : addOne );
            });
          },
        ),
        appBar: AppBar( title: Text(total.toString())),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.account_circle, size: 36,),
                title: Text(name[index])
              );
            }
        ),
      );
  }
}

class DialogUI extends StatelessWidget {
   DialogUI({Key? key, this.addOne}) : super(key: key);
   final addOne;
   var inputData = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact', style: TextStyle(fontWeight: FontWeight.bold),),
                  TextField( controller: inputData ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.pop(context, true);
                      }, child: Text('Cancel')),
                      TextButton(onPressed: (){
                        addOne();
                        Navigator.pop(context, true);
                      }, child: Text('완료'))
                    ],
                  ),
                ]
            )
        )
    );
  }
}
