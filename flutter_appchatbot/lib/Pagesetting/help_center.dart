import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HelpCenterPage2.dart';


class HelpCenterPage extends StatefulWidget {
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {

  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              SizedBox(height: 90,),
              Row(
                  children: [
                    SizedBox(width: 10,),
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
                    SizedBox(width: 160,),
                    Text(
                      "Help Center",
                      style: GoogleFonts.robotoCondensed(
                          textStyle: TextStyle(
                              shadows: [Shadow(color: Colors.black, offset: Offset(2,3), blurRadius: 10)],
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10,),
                    Stack(
                        children: [
                          Positioned(
                            left: 2,
                            top: 3,
                            child: Icon(
                              Icons.live_help_rounded, color: Colors.black38, size: 40,
                            ),
                          ),
                          Icon(
                            Icons.live_help_rounded, color: Colors.blue[500], size: 40,
                          ),
                        ]
                    )
                  ]),
            ],
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/help1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: _selectedOption == index - 1
                    ? Border.all(color: Colors.black26)
                    : null,
              ),
              child:
              ListTile(
                // leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color:
                    _selectedOption == index - 1 ? Colors.black : Colors.grey,
                  ),
                ),
                selected: _selectedOption == index - 1,
                onTap: () {
                  setState(() {
                    _selectedOption = index - 1;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// InkWell(
// child: Container(
// padding: EdgeInsets.symmetric(vertical: 15.0),
// width: double.infinity,
// child: RaisedButton(
// elevation: 5.0,
// onPressed: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => chathelp(),),);
// },
// padding: EdgeInsets.all(15.0),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30.0),
// ),
// color: Colors.white,
// child: Text(
// 'Report message',
// style: TextStyle(
// color: Color(0xFF527DAA),
// letterSpacing: 1.5,
// fontSize: 18.0,
// fontWeight: FontWeight.bold,
// fontFamily: 'OpenSans',
// ),
// ),
// ),
// ),
// )