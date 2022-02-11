import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  var name = [['고은지', '01022223333'], ['정수연', '01022223333'], ['곽청','01022223333']];
  var total = 3;

  addOne() {
    setState(() {
      total++;
    });
  }

  //과제 문제점 자식쪽에서 바꿀게 아니라 부모쪽에서 바꿀함수를 만들어서 보내는게 맞음
  addName(inputName) {
    setState(() {
      name.add(inputName);
    });
  }

  removeOne(index) {
    setState(() {
      name.removeAt(index);
    });
  }

  sortName() {
    setState(() {
      name.sort();
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
                return DialogUI( addOne : addOne, addName : addName );
            });
          },
        ),
        appBar: AppBar( title: Text(total.toString())),
        body: SizedBox(
          height:500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                sortName();
              }, icon: Icon(Icons.sort)),
              Expanded(
                child: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.account_circle, size: 36,),
                        title: Text(name[index][0]),
                        subtitle: Text(name[index][1]),
                        trailing: IconButton(icon: Icon(Icons.close), onPressed: () {
                          removeOne(index);
                        },),
                      );
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),


      );
  }
}

class DialogUI extends StatelessWidget {
   DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
   final addOne;
   final addName;
   var inputData = TextEditingController();
   var inputPhone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact', style: TextStyle(fontWeight: FontWeight.bold),),
                  TextField( controller: inputData, decoration: InputDecoration( labelText: '이름'),),
                  TextField( controller: inputPhone, decoration: InputDecoration( labelText: '연락처'), maxLength: 11,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.pop(context, true);
                      }, child: Text('Cancel')),
                      TextButton(onPressed: (){
                        if (inputData.text.isEmpty == true) {
                          showDialog(barrierDismissible: false, context: context, builder: (context) {
                              return AlertDialog(content: Text("이름을 입력하세요"), actions: [
                                TextButton(child: Text("확인"), onPressed: (){
                                  Navigator.pop(context);
                                },)
                              ],);
                          });
                        } else {
                          addOne();
                          addName([inputData.text, inputPhone.text]);
                          Navigator.pop(context, true);
                        }
                      }, child: Text('완료'))
                    ],
                  ),
                ]
            )
        )
    );;
  }
}
