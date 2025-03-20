// import 'package:flutter/material.dart';
// import 'auth_service.dart';

// class LoginePage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginePage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   //final AuthService authService = AuthService();

//   //

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Connexion réussie")),
//       );
//       // Naviguer vers la page d'accueil
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Email ou mot de passe incorrect")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Connexion")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: "Mot de passe"),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text("Se connecter"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
