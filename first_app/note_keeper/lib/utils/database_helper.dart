import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper/model/note.dart';

class DatabaseHelper
{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable='note_table';
  String colId='id';
  String colDescription='description';
  String colPriority='priority';
  String colTitle='title';
  String colDate='date';

  DatabaseHelper._createInstance();
  factory DatabaseHelper()
  {
    if(_databaseHelper==null)
      _databaseHelper=DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async
  {
    if(_database==null)
      _database= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async
  {
    Directory directory= await getApplicationDocumentsDirectory();
    String path=directory.path+'notes.db';
    var notesDatabase=await openDatabase(path,version: 1,onCreate: _createDb);
    return notesDatabase;
  }
  void _createDb(Database db,int newVersion) async
  {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)');
  }

  Future<List<Map<String,dynamic >>> getNoteMapList() async
  {
    Database db= await this.database;
    var result=await db.rawQuery('SELECT * FROM $noteTable ORDER BY $colPriority ASC');
    return result;
  }
  Future<int> insertNote(Note note) async
  {
    Database db=await this.database;
    var result=await db.insert('$noteTable', note.toMap());
    return result;
  }
  Future<int> updateNote(Note note) async
  {
    Database db=await this.database;
    var result=db.update('$noteTable', note.toMap(),where: '$colId=?',whereArgs: [note.id]);
    return result;
  }
  Future<int> delNote(int id) async
  {
    Database db=await this.database;
    var result=db.rawDelete('DELETE FROM $noteTable WHERE $colId=$id');
    return result;
  }
  Future<int> getCount() async
  {
    Database db=await this.database;
    List<Map<String,dynamic>> x=await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result=Sqflite.firstIntValue(x);
    return result;
  }
  getNoteList() async
  {
      var noteMapList=await getNoteMapList();
      int count=noteMapList.length;
      List<Note> noteList=List<Note>();
      for(int i=0;i<count;i++)
        noteList.add(Note.fromMapObject(noteMapList[i]));
      return noteList;
  }
}