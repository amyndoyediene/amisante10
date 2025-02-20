import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {"title": "Prévention du diabète", "subtitle": "Adoptez une alimentation équilibrée."},
    {"title": "Les bienfaits du sport", "subtitle": "L'exercice réduit les risques de maladies."},
    {"title": "Hygiène et prévention", "subtitle": "Lavez-vous les mains régulièrement."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactive le bouton retour
        title: Text("Éducation Santé")),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.article, color: Colors.blue),
            title: Text(articles[index]["title"]!),
            subtitle: Text(articles[index]["subtitle"]!),
            onTap: () {
              // Naviguer vers les détails de l’article
            },
          );
        },
      ),
    );
  }
}
