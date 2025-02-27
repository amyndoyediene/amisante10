// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Urgence extends StatelessWidget {
//   void _callEmergency() {
//     // Action pour appeler les urgences
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false, // Désactive le bouton retour
//           title: Text("Urgences")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Ouvrir la carte pour localiser un hôpital FirstAidPage
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CallEmergencyPage()),
//                 );
//               },
//               icon: Icon(Icons.call, color: Colors.white),
//               label: Text("Appeler les urgences"),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//             ),
          
            
//           ],
//         ),
//       ),
//     );
//   }
// }
// //////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////

// class CallEmergencyPage extends StatelessWidget {
//   final String emergencyNumber = "tel:15"; // Modifier selon le pays

//   void _callEmergency() async {
//     if (await canLaunch(emergencyNumber)) {
//       await launch(emergencyNumber);
//     } else {
//       print("Erreur lors de l'appel.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Appeler les secours")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _callEmergency,
//           style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, padding: EdgeInsets.all(20)),
//           child: Text("📞 Appeler le SAMU",
//               style: TextStyle(fontSize: 20, color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }
