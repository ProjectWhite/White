import 'package:flutter/material.dart';
import 'HelpCenterPage2.dart';
import 'ChatHelp.dart';


class HelpCenterPage extends StatefulWidget {
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help Center'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
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
        bottomSheet: InkWell(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '   chat with us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18.0,
                  ),
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.of(context).pop();
            Navigator.push(context,
                new MaterialPageRoute(
                  builder: (BuildContext context) => new chathelp(),
                ));
          },
        )
    );
  }
}
