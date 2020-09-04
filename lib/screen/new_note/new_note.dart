import 'package:crudoperation/model/note_data.dart';
import 'package:crudoperation/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewNote extends StatelessWidget {
  NewNote(this.isNew, this.note);

  final Note note;
  final bool isNew;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  void controllerCheck(bool isNew) {
    if (isNew == true) {
      titleController.text = '';
      detailsController.text = '';
    } else {
      titleController.text = note.noteTitle;
      detailsController.text = note.noteDetails;
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerCheck(isNew);
    String newTitle = '';
    String newDetails = '';
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        label: Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (isNew) {
            Provider.of<NoteData>(context, listen: false)
                .addNote(newTitle, newDetails);
            print(newTitle);
            print(newDetails);
            Navigator.pop(context);
          } else {
            // Provider.of<NoteData>(context, listen: false).update(note, note.id);

            note.noteTitle = titleController.text;
            note.noteDetails = detailsController.text;
            Navigator.pop(context);
          }
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (titleController.text.isEmpty &&
                detailsController.text.isEmpty) {
              Navigator.pop(context);
            } else {
              if (isNew) {
                Provider.of<NoteData>(context, listen: false)
                    .addNote(newTitle, newDetails);
                print(newTitle);
                print(newDetails);
                Navigator.pop(context);
              } else {
                // Provider.of<NoteData>(context, listen: false).update(note, note.id);

                note.noteTitle = titleController.text;
                note.noteDetails = detailsController.text;
                Navigator.pop(context);
              }
            }
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(color: Colors.black),
            cursorWidth: 3,
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (titleTyped) {
              newTitle = titleTyped;
            },
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: detailsController,
                decoration: InputDecoration(
                  hintText: 'Details',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
                maxLines: 60,
                onChanged: (detailsTyped) {
                  newDetails = detailsTyped;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
