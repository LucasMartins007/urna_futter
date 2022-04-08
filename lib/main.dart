import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/screens/HomeScreen.dart';
import 'package:urna_eletrnonica/screens/ResultadosScreen.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/screens/ListCandidatosWidget.dart';
import 'package:urna_eletrnonica/Splash.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/resultado': (context) => ResultadosScreen(),
        '/listaCandidatos': (context) =>
            ListCandidatosWidget(categoria: EnumCategorias.ALL),
        '/home': (context) => HomeScreen(),
      },
      title: "Urna Eletrônica",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
