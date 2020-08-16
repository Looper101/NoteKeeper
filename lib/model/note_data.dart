import 'package:crudoperation/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NoteData with ChangeNotifier {
  List<Note> noteList = [];

  get lister {
    return noteList;
  }

  int getCount() {
    return noteList.length;
  }

  deleteNote(Note note) {
    noteList.remove(note);
    notifyListeners();
  }

  addNote(String noteDetails, String noteTitle) {
    var newNote = Note(noteTitle: noteTitle, noteDetails: noteDetails);

    // noteList.add(newNote);

    // noteList.add(newNote);
    noteList.insert(0, newNote);
    notifyListeners();
  }

  updateNote({String noteDetails, String noteTitle, int index}) {
    var note = Note(noteTitle: noteTitle, noteDetails: noteDetails);

    noteList.replaceRange(index, index + 1, [note]);
    // noteList.elementAt(index);
    notifyListeners();
  }
}
