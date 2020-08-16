import 'package:crudoperation/screen/modal_bottom_screen/modal_bottom.dart';
import 'package:flutter/material.dart';

FloatingActionButton buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.black,
    elevation: 5,
    onPressed: () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return ModalBottomScreen();
          });
    },
    child: Icon(Icons.add),
  );
}
