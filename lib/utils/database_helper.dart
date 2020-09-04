import 'dart:async';

import 'package:crudoperation/model/notes.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

class DbHelper with ChangeNotifier {
  final int version = 1;

  Database db;

  DbHelper._internal();
  static final DbHelper _dbHelper = DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'noteDatabase.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE noteItems(id INTEGER PRIMARY KEY, noteDetails TEXT,noteTitle TEXT)');
      }, version: version);
    }

    notifyListeners();
    return db;
  }

  Future<int> deleteNoteDetails(Note note) async {
    var num =
        await db.delete('noteItems', where: 'id = ?', whereArgs: [note.id]);
    print(num);
  }

  Future<int> insertNoteDetails(Note note) async {
    int id = await this.db.insert('noteItems', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('Insert id: $id');
    notifyListeners();
    return id;
  }

  Future<List<Note>> getNoteDetails() async {
    final List<Map<String, dynamic>> maps = await db.query('noteItems');

    return List.generate(maps.length, (index) {
      return Note(maps[index]['id'], maps[index]['noteDetails'],
          maps[index]['noteTitle']);
    });
  }

  // ignore: missing_return
//  Future<List<Map<String, dynamic>>> getAll() async {
//    this.db = await openDb();
//    var everything = await db.query('noteItems');
//    print(everything);
//  }
//
  Future clearDb() async {
    db = await openDb();
    var result = await db.delete('noteItems');
    print(result);
    notifyListeners();
  }

  Future queryAll() async {
    db = await openDb();
    var result = await db.query('noteItems');
    print(result);
    return result;
  }
}
