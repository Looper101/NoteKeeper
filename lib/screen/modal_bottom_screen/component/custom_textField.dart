import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
      this.onChanged,
      this.hintText,
      this.textAlign,
      this.maxLines,
      this.style,
      this.maxLength});

  final Function onChanged;
  final String hintText;
  final TextAlign textAlign;
  final int maxLines;
  final TextStyle style;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.newline,
      maxLength: maxLength,
      style: style,
      cursorColor: Colors.black,
      cursorWidth: 3,
      maxLines: maxLines,
      textAlign: textAlign,
      autofocus: true,
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      onChanged: onChanged,
    );
  }
}
