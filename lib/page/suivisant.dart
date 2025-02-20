import 'package:flutter/material.dart';

class SuiviPage extends StatefulWidget {
  @override
  _SuiviPageState createState() => _SuiviPageState();
}

class _SuiviPageState extends State<SuiviPage> {
  final TextEditingController _tensionController = TextEditingController();
  final TextEditingController _glycemieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactive le bouton retour
        title: Text("Suivi Santé")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _tensionController,
              decoration: InputDecoration(labelText: "Tension artérielle (cmHg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _glycemieController,
              decoration: InputDecoration(labelText: "Glycémie (g/L)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Sauvegarder les données
              },
              child: Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
