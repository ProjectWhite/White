
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'package:flutter_appchatbot/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';

void main() => runApp(MaterialApp(
home: FirstScreen(),
));

int j = 0;
String t = "$j";
String nametest;
String date;

class FirstScreen extends StatefulWidget {

@override
_FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
@override
Widget build (BuildContext ctxt) {

  void addcoutner(){
    setState(() {
      j=j+1;
    });
  }

void delcoutner(){
    setState(() {
      j=j-1;
    });
  }

String msg='';
var dataus;

  Future<List> _readdiary() async {
    print(username);
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });

    dataus = json.decode(response.body);
// print(dataus);
// print(dataus[j]['diary'].toString());
    nametest = dataus[j]['diary'];
    date = dataus[j]['date'];
    print(date);
    print(nametest);
    return dataus;
  }

  _readdiary();
      return
        new Scaffold(
        body: Column(
         children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                        delcoutner();
                        _readdiary();
                        Navigator.push(
                          ctxt,
                          new MaterialPageRoute(builder: (ctxt) => new FirstScreen()),
                        );
                      }),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {
                        addcoutner();
                        _readdiary();
                        Navigator.push(
                          ctxt,
                          new MaterialPageRoute(builder: (ctxt) => new FirstScreen()),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0.0,0,0,40),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               RaisedButton.icon(onPressed: () {
                                 Navigator.of(context).push(MaterialPageRoute(
                                     builder: (BuildContext context) => Nav())
                                 );
                                 },
                                 icon: Icon(Icons.backspace_outlined), label: Text('First'),),
                               Text(date.toString().substring(0,10),style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20,
                                 letterSpacing: 2,
                                 color: Colors.black,
                               ),),
                             ],
                           ),
                         ),
                         Container(
                           height: 500,
                           width: 300,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Text(
                                     nametest.toString() + ' $j'
                                 ),
                               ],
                             ),
                           ),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(15)),
                             color: Colors.green,
                             // color: Color.fromRGBO(220, 220, 220, 1),
                             ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ],
        )
      );
}
}



