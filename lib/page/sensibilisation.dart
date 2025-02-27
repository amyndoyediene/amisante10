import 'package:flutter/material.dart';


class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Éducation Santé"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.health_and_safety, color: Colors.blue),
            title: Text("Prévention du diabète"),
            subtitle: Text("Adoptez une alimentation équilibrée."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreventionDiabetePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.fitness_center, color: Colors.green),
            title: Text("Les bienfaits du sport"),
            subtitle: Text("L'exercice réduit les risques de maladies."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BienfaitsSportPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.clean_hands, color: Colors.orange),
            title: Text("Hygiène et prévention"),
            subtitle: Text("Lavez-vous les mains régulièrement."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HygienePreventionPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}




///////////////////////////////////////////////////////
/////diabete


class PreventionDiabetePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prévention du Diabète")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prévention du diabète",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Pour prévenir le diabète, adoptez une alimentation équilibrée, riche en fibres et pauvre en sucre. "
              "Pratiquez une activité physique régulière et surveillez votre poids. Consultez un médecin pour des contrôles réguliers.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
//////////////////////////////////////
/////////////////sport///////////


class BienfaitsSportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les Bienfaits du Sport")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les bienfaits du sport",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Faire du sport aide à réduire le risque de maladies cardiovasculaires, "
              "contrôle la glycémie et améliore le bien-être mental. Il est recommandé de pratiquer au moins 30 minutes d'exercice par jour.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////
//////////////////higene


class HygienePreventionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hygiène et Prévention")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hygiène et prévention",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Une bonne hygiène permet d’éviter la propagation des infections. "
              "Lavez-vous les mains régulièrement, utilisez des mouchoirs à usage unique et désinfectez fréquemment les surfaces.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
