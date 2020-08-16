import 'package:crudoperation/constant/constants.dart';
import 'package:flutter/material.dart';

Row userDetailsRow(BuildContext context) {
  return Row(
    children: <Widget>[
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('asset/images/user.jpeg'),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Hi Lesnar🌵',
        style: kNoteTitleTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  );
}
