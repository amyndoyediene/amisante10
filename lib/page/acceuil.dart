import 'package:amimobile10/page/chat.dart';
import 'package:amimobile10/page/quiz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: acceuilPage(),
  ));
}

// 📌 Page d'accueil
class acceuilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Santé & Prévention"),
        automaticallyImplyLeading: false, // Désactive le bouton retour

        // backgroundColor: Colors.blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 colonnes
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildFeatureCard(
              context,
              icon: Icons.health_and_safety,
              title: "Conseils Santé",
              image: "assets/cons.png",
              color: Colors.blue,
              page: conseilPage(),
            ),
            _buildFeatureCard(
              context,
              icon: Icons.calendar_today,
              title: "Rappels Médicaux",
              image: "assets/rapel.png",
              color: Colors.blue,
              page: RappelsMedicauxPage(),
            ),
            _buildFeatureCard(
              context,
              icon: Icons.warning,
              title: "Urgences",
              image: "assets/urgence.png",
              color: Colors.blue,
              page: UrgencesPage(),
            ),
            _buildFeatureCard(
              context,
              icon: Icons.chat,
              title: "Chatbot Médical",
              image: "assets/chat.png",
              color: Colors.blue,
              page: ChatbotPage(),
            ),
            _buildFeatureCard(
              context,
              icon: Icons.quiz,
              title: "Quizz Sante",
              image: "assets/quiz.png",
              color: Colors.blue,
              page: QuizzSantePage(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour créer une carte cliquable avec image
  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String image,
      required Color color,
      required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color.withOpacity(0.1),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 60), // Ajout d'image
            SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// 🌿 Page Conseils Santé
class conseilPage extends StatelessWidget {
  final List<String> tips = [
    "💔 Massage cardiaque : 30 compressions, 2 insufflations",
    "🩸 Stopper un saignement : Appuyer avec un tissu propre",
    "🔥 Brûlure : Eau froide 10 minutes, jamais de glace",
    "⚡ Électrocution : Ne pas toucher, couper le courant",
    "🧯 Feu : Étouffer les flammes avec une couverture",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Rappels Médicaux"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2050),
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Rappel pour : ${DateFormat('dd/MM/yyyy').format(_selectedDay)}",
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
          title: Text("Alerte Urgence 🚨"),
          content: Text("Voulez-vous appeler les secours ?"),
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
              child: Text("🚨 Alerte Urgence"),
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
