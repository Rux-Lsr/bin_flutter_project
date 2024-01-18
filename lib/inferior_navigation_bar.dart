import 'package:flutter/material.dart';

class InferiorNavigationBar extends StatefulWidget {
  const InferiorNavigationBar({super.key});

  @override
  State<InferiorNavigationBar> createState() => _InferiorNavigationBar();
}

class _InferiorNavigationBar extends State<InferiorNavigationBar> {
  var _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          if (ModalRoute.of(context)!.settings.name != '/loca') {
            Navigator.pushNamedAndRemoveUntil(
                context, '/loca', (route) => false);
          }
          break;
        case 1:
          if (ModalRoute.of(context)!.settings.name != '/') {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
          break;

        default:
          print("out of bound of index");
      }
    });
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                size: 40,
              ),
              label: 'locate bin'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
              ),
              label: 'Home'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.purple,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
