import 'package:flutter/material.dart';

class UrgencePage extends StatelessWidget {
  void _callEmergency() {
    // Action pour appeler les urgences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactive le bouton retour
        title: Text("Urgences")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _callEmergency,
              icon: Icon(Icons.call, color: Colors.white),
              label: Text("Appeler les urgences"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Ouvrir la carte pour localiser un hôpital
              },
              icon: Icon(Icons.location_on, color: Colors.white),
              label: Text("Hôpitaux proches"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
