import 'package:flutter/material.dart';

class NoteDetailTextField extends StatelessWidget {
  NoteDetailTextField({this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).textScaleFactor;

    return TextField(
      textInputAction: TextInputAction.newline,
      cursorWidth: 3,
      autofocus: true,
      style: TextStyle(
          fontFamily: 'ProductSansM',
          fontWeight: FontWeight.w100,
          fontSize: fontSize * 20),
      showCursor: true,
      scrollPadding: EdgeInsets.all(10),
      maxLines: 50,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
