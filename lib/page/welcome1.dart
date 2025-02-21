import 'package:amimobile10/page/login1.dart';
import 'package:flutter/material.dart';

class Welcome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0000FF), // Bleu vif
      appBar: AppBar(
        backgroundColor: Color(0xFF0000FF), // Bleu vif
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Icône retour
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
        ),
      ),

      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre
              Text(
                "L'application mobile dédiée à la prévention des maladies.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Image
              Image.asset(
                "assets/logo2.jpeg", // Remplace avec ton image
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // Liste des points
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBulletPoint(
                      "Votre allié santé pour la prévention et le bien-être."),
                  buildBulletPoint(
                      "Prévention, conseils et suivi pour une meilleure santé."),
                  buildBulletPoint(
                      "Informez-vous, prévenez, restez en bonne santé."),
                ],
              ),
              SizedBox(height: 20),

              // Bouton Continuer
              ElevatedButton(
                onPressed: () {
                  // Navigation vers la prochaine page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login1Page()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .black, // Couleur noire // Couleur d'arrière-plan rose foncé

                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Continuer",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour afficher un élément avec une puce
  Widget buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.brightness_1, size: 10, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Welcome1(),
  ));
}
