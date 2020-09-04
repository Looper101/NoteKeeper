import 'package:crudoperation/model/notes.dart';
import 'package:crudoperation/utils/database_helper.dart';
import 'package:flutter/foundation.dart';

class NoteData with ChangeNotifier {
  DbHelper helper = DbHelper();
  List<Note> noteList = [];

  final tableName = 'noteItems';

  List get notes => [noteList];
  get items => [noteList];

  int getListLength() {
    return noteList.length;
  }

  broadCast() async {
    DbHelper helper = DbHelper();
    await helper.openDb();

    noteList = await helper.getNoteDetails();
    notifyListeners();
  }

  void addNote(String title, String details) async {
    final newNote = Note(0, details, title);
    noteList.add(newNote);
    notifyListeners();
    await helper.openDb();
    await helper.insertNoteDetails(newNote);
    notifyListeners();
  }

  Future<void> fetchAndSetData() async {
    if (helper.db != null) {
      final dataList = await helper.getNoteDetails();

      noteList = dataList;
    }
  }

  void removeNote(Note note) async {
    noteList.remove(note);
    notifyListeners();
    DbHelper helper;
    await helper.deleteNoteDetails(note);
    notifyListeners();
  }

  void update(Note note, int index) {
    final newNote = Note(index, note.noteTitle, note.noteDetails);

    noteList.replaceRange(0, index, noteList);
    notifyListeners();
  }
}
