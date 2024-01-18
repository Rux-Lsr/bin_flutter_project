import 'package:bin_project/localisation.dart';
import 'package:bin_project/manage.dart';
import 'package:bin_project/my_home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bin',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => MyHomePage(title: "Home"),
        '/loca': (context) => LocalisationScreen(),
        '/manage': (context) => ManageScreen(),
        //'/empty_bin': (context) => EmptyBin()
      },
    );
  }
}
