import 'package:crudoperation/constant/constants.dart';
import 'package:crudoperation/model/note_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/custom_textField.dart';

class ModalBottomScreen extends StatefulWidget {
  @override
  _ModalBottomScreenState createState() => _ModalBottomScreenState();
}

class _ModalBottomScreenState extends State<ModalBottomScreen> {
  @override
  Widget build(BuildContext context) {
    String typedTitle;
    String typedDetails;

    return Consumer<NoteData>(
      builder: (context, noteData, child) {
        Size size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 30,
                right: 20,
                left: 20),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  maxLines: 1,
                  maxLength: 20,
                  hintText: 'Enter Title',
                  textAlign: TextAlign.center,
                  style: kBigTextStyle.copyWith(color: Colors.black),
                  onChanged: (newValue) {
                    typedTitle = newValue;
                  },
                ),
                SizedBox(height: size.height * 0.04),
                CustomTextField(
                  maxLength: 1000,
                  hintText: 'Enter Details',
                  textAlign: TextAlign.left,
                  maxLines: 5,
                  style: kTitleTextFieldTextStyle,
                  onChanged: (newValue) {
                    typedDetails = newValue;
                  },
                ),
                SizedBox(height: 20),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  color: Color(0xFFBB0000),
                  onPressed: () {
                    if (typedDetails == null && typedTitle == null) {
                      Navigator.pop(context);
                      return null;
                    } else {
                      // Provider.of<NoteData>(context, listen: false)
                      //     .addNote(typedDetails, typedTitle);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Notes',
                    style: kNoteTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
