import 'package:amimobile10/page/assistance.dart';
import 'package:amimobile10/page/acceuil.dart';
import 'package:amimobile10/page/suivisant.dart';
//import 'package:amimobile10/page/urgence.dart';
import 'package:amimobile10/page/sensibilisation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HoPage(),
    );
  }
}

class HoPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HoPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    AccePage(),
    EducationPage(),
    SuiviPage(),
    ConsultationPage(),
    //Urgence()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.blue,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: Row(
    mainAxisSize: MainAxisSize.min, // Évite que le titre prenne toute la largeur
    children: [
      Image.asset(
        "assets/logo2.jpeg", // Remplace par ton image
        height: 30, // Ajuste la taille selon ton besoin
      ),
      SizedBox(width: 8), // Espace entre l'image et le texte
      Text(
        "A'Sante",
        style: TextStyle(color: Colors.black),
      ),
    ],
  ),
  centerTitle: true,
  iconTheme: IconThemeData(color: Colors.black),
  automaticallyImplyLeading: false,
),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor:
            Colors.blue, // Couleur des icônes sélectionnées en vert
        unselectedItemColor: Colors.blue
            .shade300, // Couleur des icônes non sélectionnées en vert clair
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Sensibilisation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Suivi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Assistance',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.warning),
          //   label: 'Urgence',
          // ),
        ],
      ),
    );
  }
}
