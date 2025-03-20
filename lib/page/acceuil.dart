import 'package:amimobile10/page/chat.dart';
import 'package:amimobile10/page/quiz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccePage(),
  ));
}

// 📌 Page d'accueil

class AccePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Santé & Prévention",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false, // Désactive le bouton retour
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 colonnes
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildFeatureCard(
              context,
              title: "Conseils Santé",
              image: "assets/cons.png",
              page: conseilPage(),
            ),
            _buildFeatureCard(
              context,
              title: "Rappels Médicaux",
              image: "assets/rapel.png",
              page: RappelsMedicauxPage(),
            ),
            _buildFeatureCard(
              context,
              title: "Urgences",
              image: "assets/urgence.png",
              page: UrgencesPage(),
            ),
            _buildFeatureCard(
              context,
              title: "Chatbot Médical",
              image: "assets/chat.png",
              page: ChatbotPage(),
            ),
            _buildFeatureCard(
              context,
              title: "Quizz Santé",
              image: "assets/quiz.png",
              page: QuizzSantePage(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour créer une carte cliquable avec image en grand format
  Widget _buildFeatureCard(BuildContext context,
      {required String title, required String image, required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child:
                    Image.asset(image, fit: BoxFit.cover), // Image plus grande
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.blue[100], // Fond bleu clair sous le titre
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🌿 Page Conseils Santé
class conseilPage extends StatelessWidget {
  final List<String> tips = [
    "💔 Massage cardiaque :  \n30 compressions, 2 insufflations",
    "🩸 Stopper un saignement :  \nAppuyer avec un tissu propre",
    "🔥 Brûlure :  \nEau froide 10 minutes, jamais de glace",
    "⚡ Électrocution :\n Ne pas toucher, couper le courant",
    "🧯 Feu :\n Étouffer les flammes avec une couverture",
    "Adoptez un mode de vie sain : \n✔️ Mangez équilibré\n✔️ Faites du sport\n✔️ Hydratez-vous\n✔️ Dormez suffisamment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:
          AppBar(backgroundColor: Colors.blue, title: Text("Conseils Santé")),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                tips[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}

// 📅 Page Rappels Médicaux avec Calendrier Interactif
class RappelsMedicauxPage extends StatefulWidget {
  @override
  _RappelsMedicauxPageState createState() => _RappelsMedicauxPageState();
}

class _RappelsMedicauxPageState extends State<RappelsMedicauxPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rappels Médicaux"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2050),
            calendarFormat: _calendarFormat,
            locale: 'fr_FR', // Définit la langue du calendrier en français
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Rappel pour : ${DateFormat.yMMMMd('fr_FR').format(_selectedDay)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


// 🚨 Page Urgences avec alerte personnalisée
class UrgencesPage extends StatelessWidget {
  void _showEmergencyAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alerte Sapeur Pompier 🚨"),
          content: Text("Voulez-vous appeler les Sapeurs Pompiers ?"),
          actions: [
            TextButton(
              child: Text("Annuler"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Appeler 📞"),
              onPressed: () {
                Navigator.of(context).pop();
                // Ici, on pourrait intégrer un appel réel
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Appel aux urgences en cours...")),
                );
              },
            ),
            SizedBox(height: 10),
            // TextButton(
            //   child: Text("Appeler 📞"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //     // Ici, on pourrait intégrer un appel réel
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text("Appel aux urgences en cours...")),
            //     );
            //   },
            // ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Urgences"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showEmergencyAlert(context),
              child: Text("🚨 Alerte Sapeur Pompier"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, padding: EdgeInsets.all(20)),
            ),
            SizedBox(height: 20), // Espacement entre les deux boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallEmergencyPage()),
                );
              },
              child: Text("🔔 Alerte samu"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, padding: EdgeInsets.all(20)),
            ),
          ],
        ),
      ),
    );
  }
}

// Fonction générique pour afficher une page simple
Widget _buildSimplePage(BuildContext context,
    {required String title,
    required String content,
    required Color color,
    required String image}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      backgroundColor: color,
    ),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 100),
            SizedBox(height: 20),
            Text(content,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    ),
  );
}

////////////////////////////////////////////////////////////////
////////////////////////////////////urgence samy
class CallEmergencyPage extends StatelessWidget {
  final String emergencyNumber = "tel:15"; // Modifier selon le pays

  void _callEmergency() async {
    if (await canLaunch(emergencyNumber)) {
      await launch(emergencyNumber);
    } else {
      print("Erreur lors de l'appel.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appeler les secours")),
      body: Center(
        child: ElevatedButton(
          onPressed: _callEmergency,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, padding: EdgeInsets.all(20)),
          child: Text("📞 Appeler le SAMU",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
