// ignore: file_names
import 'package:bin_project/navBar/Bottom_App_Bar.dart';
import 'package:bin_project/navBar/MyAppBar.dart';
import 'package:flutter/material.dart';

class AddBinPage extends StatefulWidget {
  const AddBinPage({
    super.key,
  });

  @override
  State<AddBinPage> createState() => _AddBinPageState();
}

class _AddBinPageState extends State<AddBinPage> {
  TextEditingController localisationFieldControler = TextEditingController();
  TextEditingController capacityFieldControler = TextEditingController();
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Add a trash"),
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 5)
                    ]),
                child: TextField(
                  controller: localisationFieldControler,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        'localisation',
                      ),
                      prefixIcon: Icon(Icons.location_on)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 5)
                    ]),
                child: TextField(
                  controller: capacityFieldControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        'Capacité',
                      ),
                      prefixIcon: Icon(Icons.storage)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 5)
                    ]),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        'Niveau de remplissage :      0%',
                      ),
                      prefixIcon: Icon(Icons.storage)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Couleur de fond
                          foregroundColor: Colors.black,
                          fixedSize: Size(200, 60) // Couleur du texte
                          ),
                      child: Text(
                        "Add",
                      ),
                      onPressed: () {
                        print(
                            "${localisationFieldControler.text} + ${capacityFieldControler.text}");
                      }))
            ],
          ),
        ));
  }
}
