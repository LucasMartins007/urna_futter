import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';

class ResultadosScreen extends StatefulWidget {
  const ResultadosScreen({Key? key}) : super(key: key);

  @override
  State<ResultadosScreen> createState() => _ResultadosScreenState();
}

class _ResultadosScreenState extends State<ResultadosScreen> {
  List<Candidato> candidatos = [];

  @override
  void initState() {
    Future<List<Candidato>> futureCandidatos = DBProvider().findCandidatos();
    futureCandidatos.then((value) {
      candidatos.addAll(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        title: Text("Resultados das votações!"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.none,
              width: 1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[300]!,
                Colors.blueAccent,
              ],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              child: Text(candidatos.first.autor),
            )
          ],
        ),
      ),
    );
  }
}
