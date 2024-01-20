// ignore: file_names
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        decoration: BoxDecoration(color: Colors.green[200], boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0, 7), blurRadius: 5)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_document,
                  color: Colors.black,
                  size: 40,
                )),
          ],
        ));
  }
}
