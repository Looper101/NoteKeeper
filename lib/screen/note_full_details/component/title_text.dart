import 'package:crudoperation/constant/constants.dart';
import 'package:crudoperation/model/note_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<NoteData>(context).noteList[index].noteTitle,
      style: kBlackTextStyle,
    );
  }
}
