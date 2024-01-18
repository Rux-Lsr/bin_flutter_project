import 'package:bin_project/inferior_navigation_bar.dart';
import 'package:flutter/material.dart';

class LocalisationScreen extends StatelessWidget {
  const LocalisationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          child: Center(
            child: Text(
              "Bin localiser",
              style: TextStyle(fontSize: 30),
            ),
          ),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
          height: 100,
        ),
      ),
      bottomNavigationBar: InferiorNavigationBar(),
      body: Center(
          child: Form(
              child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  labelText: 'find a bin',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.inversePrimary))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Find"),
            ),
            Divider(),
            Table(
              border: TableBorder(),
              columnWidths: {
                0: FractionColumnWidth(1 / 3),
                1: FractionColumnWidth(1 / 3),
                2: FractionColumnWidth(1 / 3),
              },
              children: [
                TableRow(children: [
                  Text(
                    'Place',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Report',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                TableRow(children: [
                  Text('mvog betsi'),
                  Text('Emptied'),
                  Icon(Icons.help_outline)
                ]),
                TableRow(children: [
                  Text('Melen'),
                  Text('full'),
                  Icon(Icons.help_outline)
                ]),
                TableRow(children: [
                  Text('Obili'),
                  Text('overflow'),
                  Icon(Icons.help_outline)
                ])
              ],
            ),
          ],
        ),
      ))),
    );
  }
}
