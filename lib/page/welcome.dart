import 'package:amimobile10/page/loof.dart';
import 'package:amimobile10/page/welcome1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommencerPage(),
    );
  }
}

class CommencerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0000FF), // Bleu vif

      //
      appBar: AppBar(
        backgroundColor: Color(0xFF0000FF), // Bleu vif

        actions: [
          IconButton(
            icon: Icon(Icons.contact_page_rounded),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => LoginePage()),
              // );
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.keyboard_command_key),
          //   onPressed: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) =>
          //     //   ()),
          //     // );
          //   },
          // ),
        ],
      ),
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100), // Pour espacer le haut
          // Image au centre
          Center(
            child: Container(
              width: 263,
              height: 262,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo.png'), // Assurez-vous que votre image est dans le dossier assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement sous l'image
          // Texte en dessous de l'image
          Text(
            'Bienvenue sur notre application',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(), // Remplir l'espace restant avant le bouton
          // Bouton "Get Started"
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ElevatedButton(
              onPressed: () {
                // Action quand on appuie sur le bouton
                // Navigation vers une nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome1()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue, // Couleur noire // Couleur d'arrière-plan rose foncé

                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Commencer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

