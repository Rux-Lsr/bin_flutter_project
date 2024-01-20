import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  late final String ttle;
  MyAppBar(this.ttle);
  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        ttle,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[200],
    );
  }
}
