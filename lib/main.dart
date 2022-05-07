import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Caluclator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController intEditingController1 = TextEditingController();
  TextEditingController intEditingController2 = TextEditingController();

  int _number1 = 0;
  int _number2 = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Demo Home Page'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 50, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 50, width: 100.0),
                    child:TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: intEditingController1,
                      decoration: InputDecoration(
                        labelText: '整数',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 50,width: 100),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: intEditingController2,
                      decoration: InputDecoration(
                        labelText: '整数',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('結果：', style: TextStyle(fontSize: 14, color: Color(0xff222222),),),
                  Text('$result',style: TextStyle(fontSize: 30, color: Color(0xff222222),),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(width: 60,height: 30),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _number1 = int.parse(intEditingController1.text);
                          _number2 = int.parse(intEditingController2.text);
                          result = _number1+_number2;
                        });
                      },
                      child: Text('+'),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ConstrainedBox(
                      constraints: BoxConstraints.expand(width: 60,height: 30),
                      child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _number1 = int.parse(intEditingController1.text);
                          _number2 = int.parse(intEditingController2.text);
                          result = _number1 - _number2;
                        });
                      },
                      child: Text('-'),
                      ),
                  ),
                  SizedBox(width: 20,),
                  ConstrainedBox(
                      constraints: BoxConstraints.expand(width: 60,height: 30),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _number1 = int.parse(intEditingController1.text);
                            _number2 = int.parse(intEditingController2.text);
                            result = _number1 * _number2;
                          });
                        },
                        child: Text('×'),
                      ),
                  ),
                  SizedBox(width: 20,),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(width: 60,height: 30),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _number1 = int.parse(intEditingController1.text);
                          _number2 = int.parse(intEditingController2.text);
                          result = _number1 ~/ _number2;
                        });
                      },
                      child: Text('÷'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}

