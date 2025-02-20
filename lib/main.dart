
import 'package:amimobile10/page/onglet.dart';
import 'package:amimobile10/page/welcome.dart';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CommencerPage(),
        'acceuil': (context) => HoPage(),
        // '/contactList': (context) => ContactList(),
        // '/detailContact': (context) => DetailContact(),
        // '/fileList': (context) => FileList(),
        // '/imagePage': (context) => ImagePage()
      },
    );
  }
}
