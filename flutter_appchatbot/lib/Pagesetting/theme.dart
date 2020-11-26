import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
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
                      "Theme",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6
                          )),
                    ),
                    SizedBox(width: 8,),
                    Icon(
                      Icons.color_lens_rounded, color: Colors.blue[500], size: 40,
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
