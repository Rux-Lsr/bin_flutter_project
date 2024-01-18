import 'package:bin_project/my_home_page.dart';
import 'package:flutter/material.dart';

class ManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          child: Center(
            child: Text(
              "Bin manager",
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
      // Utiliser la variable _body comme le corps du Scaffold
      body: _NavBarBottom()._body,
      bottomNavigationBar: NavBarBottom(),
    );
  }
}

class AddBin extends StatelessWidget {
  AddBin({
    super.key,
  });

  // Créer un contrôleur pour chaque champ du formulaire
  final placeController = TextEditingController();
  final typeController = TextEditingController();
  final capacityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Un champ pour saisir le lieu du bac
          TextFormField(
            controller: placeController,
            decoration: InputDecoration(
                labelText: 'Lieu du bac',
                prefixIcon: Icon(Icons.home_mini_rounded),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 8.0),
          // Un champ pour saisir le type de déchet du bac
          TextFormField(
            controller: typeController,
            decoration: InputDecoration(
                labelText: 'Type de déchet',
                prefixIcon: Icon(Icons.delete),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 8.0),
          // Un champ pour saisir la capacité du bac
          TextFormField(
            controller: capacityController,
            decoration: InputDecoration(
                labelText: 'Capacité du bac (en litres)',
                prefixIcon: Icon(Icons.storage),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 16.0),
          // Un bouton pour soumettre le formulaire
          ElevatedButton(
            onPressed: () {
              // Valider le formulaire et afficher un message
            },
            child: Text('Ajouter le bac'),
          ),
          _NavBarBottom().buildTable()
        ],
      )),
    );
  }
}

class EmptyBin extends StatelessWidget {
  EmptyBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Afficher le tableau des bacs sous le formulaire
      child: Placeholder(child: Text('Not Implemented')),
    );
  }
}

class NavBarBottom extends StatefulWidget {
  NavBarBottom({
    super.key,
  });

  @override
  State<NavBarBottom> createState() => _NavBarBottom();
}

class _NavBarBottom extends State<NavBarBottom> {
  var curent = 0;

  Widget _body = AddBin();

  void _onItemTapped(int index) {
    setState(() {
      curent = index;

      switch (index) {
        case 0:
          if (ModalRoute.of(context)!.settings.name != '/add_bin') {
            Navigator.pushNamedAndRemoveUntil(
                context, '/add_bin', (route) => false);
            print("0");
          }
          break;
        case 1:
          if (ModalRoute.of(context)!.settings.name != '/') {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            print("1");
          }
          break;
        case 2:
          if (ModalRoute.of(context)!.settings.name != '/empty_bin') {
            Navigator.pushNamedAndRemoveUntil(
                context, '/empty_bin', (route) => false);
            print("3");
          }
          break;
        default:
          print("out of bound of index");
      }
    });
  }

  // Créer une méthode qui renvoie un widget Table qui affiche les données de la liste des bacs
  Widget buildTable() {
    // Créer une liste de widgets TableRow pour les en-têtes et les données
    List<TableRow> rows = [];
    // Ajouter un TableRow pour les en-têtes
    rows.add(TableRow(children: [
      Text('Lieu', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('Capacité', style: TextStyle(fontWeight: FontWeight.bold)),
    ]));
    rows.add(TableRow(children: [
      Text(
        'etoug Ebe',
      ),
      Text('all'),
      Text('200'),
    ]));
    // Renvoyer un widget Table avec les lignes et une bordure
    return Table(
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ]),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'add bin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'empty the bin',
          ),
        ],
        currentIndex: curent,
        onTap: _onItemTapped,
      ),
    );
  }
}
