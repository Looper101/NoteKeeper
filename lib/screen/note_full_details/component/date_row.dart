import 'package:flutter/material.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('8/12/2020'),
        Text('9:28 AM'),
      ],
    );
  }
}
