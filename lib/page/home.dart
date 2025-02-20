import 'package:flutter/material.dart';

class HPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactive le bouton retour
        title: Text("Prévention des Maladies")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        children: [
          _buildFeatureCard(context, Icons.health_and_safety, "Conseils Santé"),
          _buildFeatureCard(context, Icons.calendar_today, "Rappels Médicaux"),
          _buildFeatureCard(context, Icons.local_hospital, "Consultation"),
          _buildFeatureCard(context, Icons.warning, "Urgences"),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // Naviguer vers la page correspondante
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
