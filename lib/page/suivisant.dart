import 'package:flutter/material.dart';

class SuiviPage extends StatefulWidget {
  @override
  _SuiviPageState createState() => _SuiviPageState();
}

class _SuiviPageState extends State<SuiviPage> {
  final TextEditingController _tensionController = TextEditingController();
  final TextEditingController _glycemieController = TextEditingController();
  String _message = "";

  void _analyserDonnees() {
    String tensionText = _tensionController.text.trim();
    String glycemieText = _glycemieController.text.trim();

    if (tensionText.isEmpty || glycemieText.isEmpty) {
      setState(() {
        _message = "Veuillez remplir tous les champs.";
      });
      return;
    }

    // Vérification de la tension (ex: "12/8")
    List<String> tensionValues = tensionText.split('/');
    if (tensionValues.length != 2) {
      setState(() {
        _message = "Format de tension incorrect. Exemple : 12/8.";
      });
      return;
    }

    double? tensionSystolique = double.tryParse(tensionValues[0]);
    double? tensionDiastolique = double.tryParse(tensionValues[1]);
    double? glycemie = double.tryParse(glycemieText);

    if (tensionSystolique == null ||
        tensionDiastolique == null ||
        glycemie == null) {
      setState(() {
        _message = "Valeurs invalides, veuillez entrer des nombres.";
      });
      return;
    }

    // Analyse des valeurs
    String resultatTension = (tensionSystolique < 14 && tensionDiastolique < 9)
        ? "Tension normale."
        : "Attention : Tension élevée ! Consultez un médecin.";

    String resultatGlycemie;
    if (glycemie < 0.70) {
      resultatGlycemie = "Hypoglycémie ! Mangez rapidement un aliment sucré.";
    } else if (glycemie >= 0.70 && glycemie <= 1.10) {
      resultatGlycemie = "Glycémie normale.";
    } else if (glycemie > 1.10 && glycemie < 1.40) {
      resultatGlycemie = "Glycémie postprandiale correcte.";
    } else {
      resultatGlycemie = "Hyperglycémie ! Consultez un médecin.";
    }

    setState(() {
      _message = "$resultatTension\n$resultatGlycemie";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Suivi Santé"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tensionController,
              decoration: InputDecoration(
                  labelText: "Tension artérielle (ex: 12/8 cmHg)"),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _glycemieController,
              decoration: InputDecoration(labelText: "Glycémie (g/L)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _analyserDonnees,
              child: Text("Vérifier"),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _message.contains("Attention") ||
                        _message.contains("Hypoglycémie") ||
                        _message.contains("Hyperglycémie")
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
