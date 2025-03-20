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
        title: Text("Consultation Médicale"),
      ),
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
                    MaterialPageRoute(
                      builder: (context) => RDVPage(),
                    ),
                  );
                  
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue, // Couleur noire // Couleur d'arrière-plan rose foncé

                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
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
/// Page de prise de rendez-vous

class RDVPage extends StatefulWidget {
  @override
  _RDVPageState createState() => _RDVPageState();
}

class _RDVPageState extends State<RDVPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDoctor;
  final List<String> doctors = [
    "Dr. DIENE - Généraliste",
    "Dr. SAMB - Cardiologue",
    "Dr. FALL - Dentiste",
    "Dr. DIENG - Ophtalmologue"
  ];

  // Contrôleurs pour les champs de saisie
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
    if (selectedDate != null &&
        selectedTime != null &&
        selectedDoctor != null &&
        nameController.text.isNotEmpty &&
        surnameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "RDV confirmé avec $selectedDoctor\n"
            "Nom: ${nameController.text} ${surnameController.text}\n"
            "Âge: ${ageController.text} ans\n"
            "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}\n"
            "Heure: ${selectedTime!.format(context)}\n"
            "Motif: ${descriptionController.text}",
          ),
        ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Informations personnelles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              // Champ Nom
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nom"),
              ),
              SizedBox(height: 10),

              // Champ Prénom
              TextField(
                controller: surnameController,
                decoration: InputDecoration(labelText: "Prénom"),
              ),
              SizedBox(height: 10),

              // Champ Âge
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Âge"),
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              // Champ Description du cas
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Description du cas médical",
                  border: OutlineInputBorder(),
                ),
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
      ),
    );
  }
}
