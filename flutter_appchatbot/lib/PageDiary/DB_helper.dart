import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'Diary.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String diaryTable = 'diary_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colColor = 'color';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'diarys.db';

    // Open/create the database at a given path
    var diarysDatabase =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return diarysDatabase;
  }

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

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $diaryTable($colId INTEGER PRIMARY KEY,'
            '$colDescription TEXT, '
            // '$colPriority INTEGER, $colColor INTEGER,'
            '$colDate TEXT)');
    // final response = await http.post("$uml/my_store/readdiary.php", body: {
    //   "username": username,
    // });
    // var dataus;
    // dataus = json.decode(response.body);
    // db.insert(diaryTable, colId = (dataus[0]['milestondeID']) );
    // db.insert(diaryTable, colDate = (dataus[0]['date']) );
    // db.insert(diaryTable, colDescription = (dataus[0]['diary']) );

  }


  // Fetch Operation: Get all diary objects from database
  Future<List<Map<String, dynamic>>> getDiaryMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $diaryTable order by $colPriority ASC');
    var result = await db.query(diaryTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a Diary object to database
  Future<int> insertDiary(Diary diary) async {
    Database db = await this.database;
    var result = await db.insert(diaryTable, diary.toMap());
    // final response = await http.post("$uml/my_store/readdiary.php", body: {
    //   "username": username,
    // });
    // var dataus;
    // dataus = json.decode(response.body);
    // var result =
    // db.insert(diaryTable, colId = (dataus[0]['milestondeID']) );
    // db.insert(diaryTable, colDate = (dataus[0]['date']) );
    // db.insert(diaryTable, colDescription = (dataus[0]['diary']) );

    return result;
  }

  // Update Operation: Update a Diary object and save it to database
  Future<int> updateDiary(Diary diary) async {
    var db = await this.database;
    var result = await db.update(diaryTable, diary.toMap(),
        where: '$colId = ?', whereArgs: [diary.id]);
    return result;
  }

  // Delete Operation: Delete a Diary object from database
  Future<int> deleteDiary(int id) async {
    var db = await this.database;
    int result =
    await db.rawDelete('DELETE FROM $diaryTable WHERE $colId = $id');
    return result;
  }

  // Get number of Diary objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $diaryTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Diary List' [ List<Diary> ]
  Future<List<Diary>> getDiaryList() async {
    var diaryMapList = await getDiaryMapList(); // Get 'Map List' from database
    int count =
        diaryMapList.length; // Count the number of map entries in db table

    List<Diary> diaryList = List<Diary>();
    // For loop to create a 'Diary List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      diaryList.add(Diary.fromMapObject(diaryMapList[i]));
    }

    return diaryList;
  }
}
