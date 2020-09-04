import 'package:crudoperation/constant/constants.dart';
import 'package:crudoperation/model/note_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widget notesCount({int index, , int count}) {
//   return NoteCounter();
// }

class NoteCounter extends StatelessWidget {
  const NoteCounter({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<NoteData>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
      // height: 300.0,
      // width: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF000000),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(title, style: kBigTextStyle),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightGreen.shade200,
                    spreadRadius: 0.000005,
                  ),
                ],
              ),
              child: Text(
                prov.getListLength().toString(),
                style: kNoteCountTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
