import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatePage extends StatefulWidget {
  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300] ,
      body: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 25),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5,
                  color: Colors.blue[500],
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Rate Us",
                      style: GoogleFonts.robotoCondensed(
                          textStyle: TextStyle(
                              shadows: [Shadow(color: Colors.black, offset: Offset(2,3), blurRadius: 10)],
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 8,),
                    Stack(
                        children: [
                          Positioned(
                            left: 2,
                            top: 3,
                            child: Icon(
                              Icons.star_rate_rounded, color: Colors.black38, size: 40,
                            ),
                          ),
                          Icon(
                            Icons.star_rate_rounded, color: Colors.blue[500], size: 40,
                          ),
                        ]
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
