import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/ResultadosScreen.dart';
import 'package:urna_eletrnonica/widget/ListCandidatosWidget.dart';
import 'package:urna_eletrnonica/Splash.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/resultado': (context) => ResultadosScreen(),
      '/listaCandidatos': (context) => ResultadosScreen(),
    },
    title: "Urna Eletrônica",
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}
