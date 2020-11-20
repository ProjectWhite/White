import 'package:flutter/material.dart';

class WhiteProfilePage extends StatefulWidget {
  @override
  _WhiteProfilePageState createState() => _WhiteProfilePageState();
}

class _WhiteProfilePageState extends State<WhiteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'White Profile',
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
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
        child: ListView(
          children: [
            Center(
              child: Text(
                'WHITE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,10),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://media4.giphy.com/media/IXnygGeB6LPPi/giphy.gif'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(height: 15, thickness: 2,),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3, top: 8),
                hintText: 'Write anything...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
