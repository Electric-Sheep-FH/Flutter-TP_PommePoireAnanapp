import 'package:flutter/material.dart';
import 'package:pomme_poire_ananas/banartwork.dart';

class Ananapp extends StatelessWidget {
  const Ananapp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Pomme, Poire, Ananas",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(199, 237, 141, 15)),
      ),
      home: const Banartwork(),
    );
  }
}