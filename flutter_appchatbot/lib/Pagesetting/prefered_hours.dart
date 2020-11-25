import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class PreferedHoursPage extends StatefulWidget {

  PreferedHoursPage({Key key}) : super(key: key);

  @override
  _PreferedHoursPageState createState() => _PreferedHoursPageState();
}

const String INIT_DATETIME = '0000-00-00 00:00:00';


class _PreferedHoursPageState extends State<PreferedHoursPage> {

  String _format = 'HH:mm';
  TextEditingController _formatCtrl = TextEditingController();
  DateTime _dateTime;
  @override

  void initState() {
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  Widget build(BuildContext context) {
    var headline = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)
    );
    var body = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)
    );
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
                      "Preferred Hours",
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
                              Icons.access_time_rounded, color: Colors.black38, size: 40,
                            ),
                          ),
                          Icon(
                            Icons.access_time_rounded, color: Colors.blue[500], size: 40,
                          ),
                        ]
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: _showTimePicker,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Time:',
                      style: headline),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                        '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}',
                        style: body),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker() {
    var body1 = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54)
    );
    DatePicker.showDatePicker(
      context,
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      pickerTheme: DateTimePickerTheme(
        title: Container(
          decoration: BoxDecoration(color: Colors.white70),
          width: double.infinity,
          height: 56.0,
          alignment: Alignment.center,
          child: Text(
            'Preferred Hours',
            style: body1,
          ),
        ),
        titleHeight: 56.0,
      ),
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }



}
