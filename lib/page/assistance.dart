import 'package:flutter/material.dart';

class ConsultationPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {"name": "Dr. Diene", "specialty": "Cardiologue"},
    {"name": "Dr. Mbengue", "specialty": "Généraliste"},
    {"name": "Dr. Babou", "specialty": "Diabétologue"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // Désactive le bouton retour
          title: Text("Consultation Médicale")),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(doctors[index]["name"]!),
              subtitle: Text(doctors[index]["specialty"]!),
              trailing: ElevatedButton(
                onPressed: () {
                  // Réserver une consultation
                },
                child: Text("Prendre RDV"),
              ),
            ),
          );
        },
      ),
    );
  }
}
