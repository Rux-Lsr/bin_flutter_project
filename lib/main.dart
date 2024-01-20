import 'dart:convert';
import 'package:bin_project/addBin.dart';
import 'package:bin_project/navBar/Bottom_App_Bar.dart';
import 'package:bin_project/navBar/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bin',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration:
              BoxDecoration(color: Colors.green[400], shape: BoxShape.circle),
          child: IconButton(
            icon: Icon(
              Icons.add_rounded,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return AddBinPage();
                      },
                      fullscreenDialog: true));
            },
          ),
        ),
        appBar: MyAppBar("Explore"),
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [SearchSection(), BodyApp()],
          ),
        ));
  }
}

class BodyApp extends StatefulWidget {
  const BodyApp({
    super.key,
  });

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  late List poubelles;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void loadJson() async {
    String data = await rootBundle.loadString("json/bin.json");
    List jsonResult = jsonDecode(data);
    setState(() {
      poubelles = jsonResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Poubelle: ${poubelles.length}",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(children: [
                  Text(
                    'Filter',
                  ),
                  Icon(
                    Icons.filter_list_outlined,
                    color: Colors.green[200],
                  )
                ]),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: poubelles.map((poubelle) {
              return Container(
                height: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 5)
                    ]),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[300],
                      ),
                      height: 200,
                      child: Placeholder()),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              '${poubelle['localisation']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Capacité: ${poubelle['capacité']}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 7), blurRadius: 5)
              ]),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        )),
        Container(
          height: 70,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.green[200],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 7), blurRadius: 5)
              ]),
          child: ElevatedButton(
              onPressed: null,
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              )),
        )
      ]),
    );
  }
}
