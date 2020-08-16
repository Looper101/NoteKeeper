import 'package:crudoperation/constant/constants.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard(
      {Key key, this.details, this.title, this.onLongPress, this.onTap})
      : super(key: key);
  final String title;
  final String details;
  final Function onLongPress;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02, vertical: size.height * 0.005),
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.035, vertical: size.height * 0.013),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0X77FFEFDD)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: kNoteTitleTextStyle,
                  ),
                ),
                Text(
                  '3: 45',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                )
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    details.substring(0, details.length >= 30 ? 30 : null),
                    style: kNoteDetailsTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    '.. Read More',
                    style: kNoteDetailsTextStyle.copyWith(fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text(
            //       '10 Oct',
            //       style: TextStyle(
            //           fontSize: 15,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.grey),
            //     ),
            //     Container(
            //       height: 30,
            //       width: 30,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       child: Icon(
            //         Icons.location_on,
            //         color: Colors.white,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
