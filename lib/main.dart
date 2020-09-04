import 'package:crudoperation/model/note_data.dart';
import 'package:crudoperation/notes/noteUi.dart';
import 'package:crudoperation/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      // providers: [
      // ChangeNotifierProvider<DbHelper>(create: (context) => DbHelper()),
      // ChangeNotifierProxyProvider(
      //     create: (context) => NoteData(),
      //     update: (context, db, previous) => NoteData())

      // ChangeNotifierProvider<NoteData>(create: ),

      // ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: NotesKeeper(),
      ),
    );
  }
}
