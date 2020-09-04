import 'package:crudoperation/model/notes.dart';
import 'package:crudoperation/screen/new_note/new_note.dart';
import 'package:flutter/material.dart';

FloatingActionButton buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.black,
    elevation: 5,
    child: Icon(Icons.add),
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewNote(true, Note(0, '', '')),
      ),
    ),
  );
}
