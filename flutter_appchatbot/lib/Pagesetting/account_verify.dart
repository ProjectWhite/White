import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Email',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
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
