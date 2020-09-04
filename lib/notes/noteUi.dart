import 'package:crudoperation/component/floating_action_button.dart';
import 'package:crudoperation/component/notes_card.dart';
import 'package:crudoperation/component/notes_counter.dart';
import 'package:crudoperation/component/tab_bar.dart';
import 'package:crudoperation/component/user_detail_row.dart';
import 'package:crudoperation/model/note_data.dart';
import 'package:crudoperation/screen/new_note/new_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../utils/database_helper.dart';

class NotesKeeper extends StatefulWidget {
  @override
  _NotesKeeperState createState() => _NotesKeeperState();
}

class _NotesKeeperState extends State<NotesKeeper>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  DbHelper helper = DbHelper();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();

  //   Provider.of<NoteData>(context).broadCast();
  // }

  @override
  Widget build(BuildContext context) {
    // Provider.of<NoteData>(context).broadCast();

    Size size = MediaQuery.of(context).size;
    helper.openDb();

    var prov = Provider.of<NoteData>(context, listen: true);

    // helper.queryAll();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: buildFloatingActionButton(context),
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: userDetailsRow(context),
                    ),
                    NoteCounter(
                      title: 'Notes',
                    ),
                    TabbarCustom(tabController: _tabController),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.00,
                      vertical: size.height * 0.000),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Consumer<NoteData>(
                    builder: (context, ntd, child) {
                      return StaggeredGridView.countBuilder(
                        itemCount: ntd.noteList.length,
                        crossAxisCount: 4,
                        itemBuilder: (context, int index) {
                          return Dismissible(
                            key: Key(ntd.noteList[index].noteTitle),
                            onDismissed: (direction) {
                              ntd.removeNote(ntd.noteList[index]);
                            },
                            child: NotesCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NewNote(
                                          false, ntd.noteList[index]);
                                    },
                                  ),
                                );
                              },
                              title: ntd.noteList[index].noteTitle,
                              details: ntd.noteList[index].noteDetails,
                              onLongPress: () {
                                var note = prov.noteList[index];
                                prov.removeNote(note);
                              },
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.fit(2);
                        },
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
