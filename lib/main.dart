import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> arrary = [];
  var _addText = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: Text('ToDoリスト'),
          backgroundColor: Colors.black12,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _addText,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      backgroundColor: Colors.blue[300],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'TEXTBOX',
                      labelStyle: TextStyle(
                        backgroundColor: Colors.blue[300],
                        color: Colors.white,
                      ),
                      hintText: '何か入力してみたら？',
                      hintStyle: TextStyle(
                        backgroundColor: Colors.blue[300],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => setState(
                      () {
                        arrary.add(_addText.text);
                        _addText.clear();
                      },
                    ),
                    child: Text('追加'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrary.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          arrary[index],
                        ),
                        RaisedButton(
                          child: Text('削除'),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: () => setState(
                            () {
                              arrary.removeAt(index);
                            },
                          ),
                        )
                      ],
                    ),
                  ); // child: Text(arrary[index], style: TextStyle(fontSize: 24))),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
