import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
class wellcome2 extends StatefulWidget {
  @override
  _wellcome2State createState() => _wellcome2State();
}

class _wellcome2State extends State<wellcome2> {
  Future<List> _read() async {
    final response = await http.post(
        "https://aac4cf39108a.ngrok.io/my_store/read.php", body: {
      "username": username,
    });

    var data = json.decode(response.body);
    print(data[0]['nickname']);

    Navigator.pushReplacementNamed(context, '/chat');
    setState(() {
      name = data[0]['nickname'];
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wellcome2'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          color: Colors.white,
          child: Text(
              "Next"
          ),
          onPressed: () {
            _read();
          }, // Navigator.pushReplacementNamed(context, '/MyHomePage')
        ),
      ),
    );
  }
}
