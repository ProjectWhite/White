import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'Diary.dart';
import 'DB_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Search.dart';
import 'Widget.dart';
import 'Diary_Detail.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:http/http.dart' as http;

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}


class _DiaryPageState extends State<DiaryPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Diary> diaryList;
  int count = 0;
  int axisCount = 2;

  Future<List> _readdiary() async {
    print('read');
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });
    var dataus;

    dataus = json.decode(response.body);

    print(dataus);
    print(dataus[0]['diary']);
    print(dataus[0]['date']);

    return dataus;
  }

  @override

  Widget build(BuildContext context) {
    _readdiary();
    if (diaryList == null) {
      diaryList = List<Diary>();
      updateListView();
    }
    Widget myAppBar() {
      return AppBar(
        title: Text('Diarys', style: Theme.of(context).textTheme.headline),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: diaryList.length == 0
            ? Container()
            : IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () async {
            final Diary result = await showSearch(
                context: context, delegate: DiarysSearch(diarys: diaryList));
            if (result != null) {
              navigateToDetail(result, 'Edit Diary');
            }
          },
        ),
        actions: <Widget>[
          diaryList.length == 0
              ? Container(

          )
              : IconButton(
            icon: Icon(
              axisCount == 2 ? Icons.list : Icons.grid_on,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                axisCount = axisCount == 2 ? 4 : 2;
              });
            },
          )
        ],
      );
    }

    return Scaffold(
      appBar: myAppBar(),
      body: diaryList.length == 0
          ? Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Click on the add button to add a new diary!',
                style: Theme.of(context).textTheme.body1),
          ),
        ),
      )
          : Container(
        color: Colors.white,
        child: getDiarysList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Diary('', 3, 0), 'Add Diary');
        },
        tooltip: 'Add Diary',
        shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2.0)),
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget getDiarysList() {
    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: count,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          navigateToDetail(this.diaryList[index], 'Edit Diary');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                // color: colors[this.diaryList[index].color],
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       this.diaryList[index].title,
                    //       style: Theme.of(context).textTheme.body1,
                    //     ),
                    //   ),
                    // ),
                    // Text(
                    //   getPriorityObject(this.diaryList[index].priority),
                    //   style: TextStyle(
                    //       color: getPriorityColor(
                    //           this.diaryList[index].priority)),
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            this.diaryList[index].description == null
                                ? ''
                                : this.diaryList[index].description,
                            style: Theme.of(context).textTheme.body2),
                      )
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(this.diaryList[index].date,
                          style: Theme.of(context).textTheme.subtitle),
                    ])
              ],
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(axisCount),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  // Returns the priority color
  // Color getPriorityColor(int priority) {
  //   switch (priority) {
  //     case 1:
  //       return Colors.deepPurple;
  //       break;
  //     case 2:
  //       return Colors.indigo[500];
  //       break;
  //     case 3:
  //       return Colors.blue;
  //       break;
  //
  //     default:
  //       return Colors.white;
  //   }
  // }
  //
  // // Returns the priority icon
  // String getPriorityObject(int priority) {
  //   switch (priority) {
  //     // case 1:
  //     //   return '⬤';
  //     //   break;
  //     // case 2:
  //     //   return '⬤';
  //     //   break;
  //     // case 3:
  //     //   return '⬤';
  //     //   break;
  //
  //     default:
  //       return '⬤';
  //   }
  // }

  // void _delete(BuildContext context, Diary diary) async {
  //   int result = await databaseHelper.deleteDiary(diary.id);
  //   if (result != 0) {
  //     _showSnackBar(context, 'Diary Deleted Successfully');
  //     updateListView();
  //   }
  // }

  // void _showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

  void navigateToDetail(Diary diary, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => DiaryDetail(diary, title)));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Diary>> diaryListFuture = databaseHelper.getDiaryList();
      diaryListFuture.then((diaryList) {
        setState(() {
          this.diaryList = diaryList;
          this.count = diaryList.length;
        });
      });
    });
  }

  Future<List> readdiary() async {
    print(username);
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });
  }
}
