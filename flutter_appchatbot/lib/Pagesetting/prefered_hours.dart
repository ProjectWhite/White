import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/setting.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferred Hours',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[

            InkWell(
              onTap: _showTimePicker,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Time:',
                      style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                        '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}',
                        style: Theme.of(context).textTheme.title),
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
    DatePicker.showDatePicker(
      context,
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      pickerTheme: DateTimePickerTheme(
        title: Container(
          decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
          width: double.infinity,
          height: 56.0,
          alignment: Alignment.center,
          child: Text(
            'Preferred Hours',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
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
