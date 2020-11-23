import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DB_helper.dart';
import 'Diary.dart';
import 'Widget.dart';

class DiaryDetail extends StatefulWidget {
  final String appBarTitle;
  final Diary diary;

  DiaryDetail(this.diary, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return DiaryDetailState(this.diary, this.appBarTitle);
  }
}

class DiaryDetailState extends State<DiaryDetail> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Diary diary;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int color;
  bool isEdited = false;

  DiaryDetailState(this.diary, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    // titleController.text = diary.title;
    descriptionController.text = diary.description;
    color = diary.color;
    return WillPopScope(
        onWillPop: () {
          isEdited ? showDiscardDialog(context) : moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appBarTitle,
              style: Theme.of(context).textTheme.headline,
            ),
            // backgroundColor: colors[color],
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  isEdited ? showDiscardDialog(context) : moveToLastScreen();
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                onPressed: () {
                  // titleController.text.length == 0
                      // ? showEmptyTitleDialog(context)
                  _save();
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                onPressed: () {
                  showDeleteDialog(context);
                },
              )
            ],
          ),
          body: Container(
            // color: colors[color],
            child: Column(
              children: <Widget>[
                PriorityPicker(
                  selectedIndex: 3 - diary.priority,
                  onTap: (index) {
                    isEdited = true;
                    diary.priority = 3 - index;
                  },
                ),
                // ColorPicker(
                //   selectedIndex: diary.color,
                //   onTap: (index) {
                //     setState(() {
                //       color = index;
                //     });
                //     isEdited = true;
                //     diary.color = index;
                //   },
                // ),
                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: TextField(
                //     controller: titleController,
                //     maxLength: 255,
                //     style: Theme.of(context).textTheme.body1,
                //     onChanged: (value) {
                //       updateTitle();
                //     },
                //     decoration: InputDecoration.collapsed(
                //       hintText: 'Title',
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      maxLength: 255,
                      controller: descriptionController,
                      style: Theme.of(context).textTheme.body2,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Discard Changes?",
            style: Theme.of(context).textTheme.body1,
          ),
          content: Text("Are you sure you want to discard changes?",
              style: Theme.of(context).textTheme.body2),
          actions: <Widget>[
            FlatButton(
              child: Text("No",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Yes",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  // void showEmptyTitleDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //         title: Text(
  //           "Title is empty!",
  //           style: Theme.of(context).textTheme.body1,
  //         ),
  //         content: Text('The title of the diary cannot be empty.',
  //             style: Theme.of(context).textTheme.body2),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text("Okay",
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .body1
  //                     .copyWith(color: Colors.purple)),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Delete Diary?",
            style: Theme.of(context).textTheme.body1,
          ),
          content: Text("Are you sure you want to delete this diary?",
              style: Theme.of(context).textTheme.body2),
          actions: <Widget>[
            FlatButton(
              child: Text("No",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Yes",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),
          ],
        );
      },
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // void updateTitle() {
  //   isEdited = true;
  //   diary.title = titleController.text;
  // }

  void updateDescription() {
    isEdited = true;
    diary.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    diary.date = DateFormat.yMMMd().format(DateTime.now());

    if (diary.id != null) {
      await helper.updateDiary(diary);
    } else {
      await helper.insertDiary(diary);
    }
  }

  void _delete() async {
    await helper.deleteDiary(diary.id);
    moveToLastScreen();
  }
}
