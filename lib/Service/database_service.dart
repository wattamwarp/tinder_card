import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../Model/favourite_model.dart';

class DatabaseService {

  static DatabaseService _databaseHelper;
  static Database _database;

  String favouriteTable = 'favourite_table';
  String colId = 'id';
  String colTitle = 'title';
  String colName = 'name';
  String colPriority = 'priority';
  String colDate = 'date';
  String colLocation = 'location';
  String colRegistered='registered';

  DatabaseService._createInstance();
  factory DatabaseService() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseService._createInstance();
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


    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notesnew3rewq .db';
    print("the path is"+path);

    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $favouriteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colName TEXT, $colPriority INTEGER, $colDate TEXT, $colLocation TEXT, $colRegistered TEXT)');
  }

  Future<List<Map<String, dynamic>>> getFavouriteMapList() async {
    Database db = await this.database;

    var result = await db.query(favouriteTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertFavourite(FavouriteModel note) async {
    Database db = await this.database;
    var result = await db.insert(favouriteTable, note.toMap());
    return result;
  }



  Future<List<FavouriteModel>> getFavouriteList() async {

    var noteMapList = await getFavouriteMapList();
    int count = noteMapList.length;

    List<FavouriteModel> noteList = List<FavouriteModel>();
    for (int i = 0; i < count; i++) {
      noteList.add(FavouriteModel.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}