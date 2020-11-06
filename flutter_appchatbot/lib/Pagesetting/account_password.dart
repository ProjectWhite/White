 import 'package:flutter/material.dart';

class AccountPasswordPage extends StatefulWidget {
  @override
  _AccountPasswordPageState createState() => _AccountPasswordPageState();
}

class _AccountPasswordPageState extends State<AccountPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
