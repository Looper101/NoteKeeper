//import 'package:crudoperation/constant/constants.dart';
//import 'package:crudoperation/model/note_data.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//import 'component/date_row.dart';
//import 'component/note_Detail_textfield.dart';
//import 'component/title_text.dart';
//
//class NoteDetailScreen extends StatefulWidget {
//  NoteDetailScreen(this.index);
//
//  final int index;
//
//  @override
//  _NoteDetailScreenState createState() => _NoteDetailScreenState();
//}
//
//class _NoteDetailScreenState extends State<NoteDetailScreen> {
//  TextEditingController textEditingController;
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    textEditingController = TextEditingController(
//        text:
//            Provider.of<NoteData>(context).noteList[widget.index].noteDetails);
//  }
//
//  @override
//  void dispose() {
//    textEditingController.dispose();
//    super.dispose();
//  }
//
//  String details;
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    details = Provider.of<NoteData>(context).noteList[widget.index].noteDetails;
//
//    String title =
//        Provider.of<NoteData>(context).noteList[widget.index].noteTitle;
//    var prov = Provider.of<NoteData>(context);
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        elevation: 0,
//        // title: Text(Provider.of<NoteData>(context).noteList[index].noteTitle),
//      ),
//      backgroundColor: Colors.grey,
//      floatingActionButton: FAB(
//        onPress: () {
//          details = textEditingController.text;
//          // Provider.of<NoteData>(context, listen: false).updateNote(
//          //     noteDetails: textEditingController.text,
//          //     noteTitle: title,
//          //     index: widget.index);
//          Navigator.pop(context);
//        },
//      ),
//      body: SafeArea(
//        child: Container(
//          // margin: EdgeInsets.all(10),
//          margin: EdgeInsets.symmetric(
//              horizontal: size.width * 0.04, vertical: size.height * 0.005),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Expanded(
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                    // margin: EdgeInsets.all(10),
//                    padding: EdgeInsets.all(20),
//                    decoration: BoxDecoration(
//                      color: Colors.amber,
//                      borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(10),
//                        topRight: Radius.circular(10),
//                      ),
//                    ),
//                    child: SingleChildScrollView(
//                      child: TitleText(index: widget.index),
//                    ),
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 5,
//                child: Container(
//                  padding: EdgeInsets.all(10),
//                  alignment: Alignment.topLeft,
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.only(
//                      topRight: Radius.circular(5),
//                    ),
//                  ),
//                  child: ListView(
//                    children: [
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          DateRow(),
//                          Padding(
//                            padding: const EdgeInsets.symmetric(vertical: 10),
//                            child: NoteDetailTextField(
//                                controller: textEditingController),
//                          ),
//                          SizedBox(
//                            height: size.height * 0.04,
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class FAB extends StatelessWidget {
//  const FAB({Key key, this.onPress}) : super(key: key);
//  final Function onPress;
//  @override
//  Widget build(BuildContext context) {
//    return RawMaterialButton(
//      onPressed: onPress,
//      fillColor: Colors.black,
//      child: Text(
//        'Update Note',
//        style: kBigTextStyle,
//      ),
//    );
//  }
//}
//
////  DetailText(index: widget.index),
