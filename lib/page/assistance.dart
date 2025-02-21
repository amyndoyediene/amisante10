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
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>RDVPage
                ()),
              );
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
///////////////////////////////////////////////////////////////
///


class RDVPage extends StatefulWidget {
  @override
  _RDVPageState createState() => _RDVPageState();
}

class _RDVPageState extends State<RDVPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDoctor;

  final List<String> doctors = [
    "Dr. Jean Dupont - Généraliste",
    "Dr. Marie Curie - Cardiologue",
    "Dr. Ahmed Diallo - Dentiste",
    "Dr. Lisa Martin - Ophtalmologue"
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmRDV() {
    if (selectedDate != null && selectedTime != null && selectedDoctor != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Rendez-vous confirmé avec $selectedDoctor le ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} à ${selectedTime!.format(context)}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez compléter toutes les informations")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prendre un Rendez-vous"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sélectionner un médecin :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedDoctor,
              isExpanded: true,
              hint: Text("Choisissez un médecin"),
              items: doctors.map((doctor) {
                return DropdownMenuItem<String>(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value;
                });
              },
            ),
            SizedBox(height: 20),

            Text("Sélectionner une date :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate == null
                  ? "Choisir une date"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
            ),
            SizedBox(height: 20),

            Text("Sélectionner une heure :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(selectedTime == null
                  ? "Choisir une heure"
                  : selectedTime!.format(context)),
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: _confirmRDV,
                child: Text("Confirmer le RDV", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

