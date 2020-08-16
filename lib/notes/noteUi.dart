import 'package:crudoperation/component/floating_action_button.dart';
import 'package:crudoperation/component/notes_card.dart';
import 'package:crudoperation/component/notes_counter.dart';
import 'package:crudoperation/component/tab_bar.dart';
import 'package:crudoperation/component/user_detail_row.dart';

import 'package:crudoperation/model/note_data.dart';

import 'package:crudoperation/screen/note_full_details/note_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

class NotesKeeper extends StatefulWidget {
  @override
  _NotesKeeperState createState() => _NotesKeeperState();
}

class _NotesKeeperState extends State<NotesKeeper>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: buildFloatingActionButton(context),
        backgroundColor: Colors.white,
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
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.005),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView.builder(
                    itemCount: Provider.of<NoteData>(context).getCount(),
                    itemBuilder: (context, index) {
                      return NotesCard(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NoteDetailScreen(index);
                          }));
                        },
                        title: Provider.of<NoteData>(context)
                                    .noteList[index]
                                    .noteTitle ==
                                null
                            ? 'Title not specified'
                            : Provider.of<NoteData>(context)
                                .lister[index]
                                .noteTitle,
                        details: Provider.of<NoteData>(context)
                            .lister[index]
                            .noteDetails,
                        onLongPress: () {
                          Provider.of<NoteData>(context, listen: false)
                              .deleteNote(
                                  Provider.of<NoteData>(context, listen: false)
                                      .noteList[index]);
                        },
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
