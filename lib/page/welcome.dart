import 'package:amimobile10/page/login1.dart';
import 'package:amimobile10/page/suivisant.dart';
import 'package:amimobile10/page/welcome1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommencerPage(),
    );
  }
}

class CommencerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0000FF), // Bleu vif

      //
      appBar: AppBar(
        backgroundColor: Color(0xFF0000FF), // Bleu vif

        actions: [
          // IconButton(
          //   icon: Icon(Icons.contact_page_rounded),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => pvPage()),
          //     );
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.keyboard_command_key),
          //   onPressed: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) =>
          //     //   ()),
          //     // );
          //   },
          // ),
        ],
      ),
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100), // Pour espacer le haut
          // Image au centre
          Center(
            child: Container(
              width: 263,
              height: 262,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo.png'), // Assurez-vous que votre image est dans le dossier assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement sous l'image
          // Texte en dessous de l'image
          Text(
            'Bienvenue sur notre application',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(), // Remplir l'espace restant avant le bouton
          // Bouton "Get Started"
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ElevatedButton(
              onPressed: () {
                // Action quand on appuie sur le bouton
                // Navigation vers une nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome1()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .black, // Couleur noire // Couleur d'arrière-plan rose foncé

                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Commencer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:amimobile9/page/onglet.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CommencerPage(),
//     );
//   }
// }

// class CommencerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Logo en haut à gauche
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     'assets/acc2.png', // Remplacez par le chemin de votre logo
//                     height: 40,
//                   ),
//                 ],
//               ),
//             ),

//             // Image principale
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(
//                   'assets/acc3.png', // Remplacez par le chemin de votre image principale
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Texte principal
//             const Text(
//               'ONLINE',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const Text(
//               'TRAINING',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),

//             // Date et heure
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.green),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Text(
//                     '02 January, 2024',
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.orange),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Text(
//                     '09:00 - 11:00',
//                     style: TextStyle(color: Colors.orange),
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),

//             // Bouton "Commencer"
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HoPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Commencer',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
