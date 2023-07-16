import 'package:flutter/material.dart';
import 'dart:io';

import 'package:workshop_teste/pokemon/screens/pokemon_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Pokémon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonScreen(
          title: 'App para buscar uma lista de pokémons de uma API'),
    );
  }
}
