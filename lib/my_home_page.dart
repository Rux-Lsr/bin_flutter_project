import 'package:flutter/material.dart';
import 'package:bin_project/inferior_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: InferiorNavigationBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            child: Center(
              child: Text(
                "Home",
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarouselSlider(
                items: [
                  Image.network(
                    'https://environnementales.com/wp-content/uploads/2023/01/1005257_505919629482038_1974683458_n-750x350.jpg',
                    height: 200,
                  ),
                  Image.network(
                    'https://fr.journalducameroun.com/wp-content/uploads/2023/01/vil-780x440.jpg',
                    height: 200,
                  ),
                  Image.network(
                    'https://www.hysacam-proprete.com/sites/default/files/article/images/Bonne%20F%C3%AAte%20du%20Travail.jpg',
                    height: 200,
                  ),
                  Image.network(
                    'https://devinfo237.com/wp-content/uploads/2021/07/Photo-Poubelle-.jpg',
                    height: 200,
                  ),
                ],
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/manage');
                      },
                      icon: Icon(
                        Icons.settings,
                        size: 80,
                      )),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loca');
                    },
                    icon: Image.network(
                      'https://www.crouysurcosson.fr/wp-content/uploads/sites/23/2020/09/Dechets.jpg',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
