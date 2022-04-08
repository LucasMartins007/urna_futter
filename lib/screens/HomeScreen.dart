import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';
import 'package:urna_eletrnonica/services/CandidatosService.dart';
import 'package:urna_eletrnonica/widget/DrawerWidget.dart';
import 'package:urna_eletrnonica/widget/TopCategoriasWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Candidato> candidatos = [];

  @override
  void initState() {
    candidatos = CategoriasHelper().getValue(EnumCategorias.ALL);
    Future<List<Candidato>> future = DBProvider().findCandidatos();

    future.then((value) {
      if (value.isEmpty) {
        candidatos.forEach((element) {
          DBProvider().addItem(element);
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Urna de Popularidade!"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text(
                "Vote nos seus favoritos do TOP 5 mundial!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            resolverCategoriasVotadas(EnumCategorias.MUSICAS.name)
                ? TopCategoriasWidget(
                    title: "TOP 5 Músicas",
                    categoria: EnumCategorias.MUSICAS,
                  )
                : Text(""),
            resolverCategoriasVotadas(EnumCategorias.FILMES.name)
                ? TopCategoriasWidget(
                    title: "TOP 5 Filmes",
                    categoria: EnumCategorias.FILMES,
                  )
                : Text(""),
            resolverCategoriasVotadas(EnumCategorias.SERIES.name)
                ? TopCategoriasWidget(
                    title: "TOP 5 Series",
                    categoria: EnumCategorias.SERIES,
                  )
                : Text(""),
            resolverCategoriasVotadas(EnumCategorias.LIVROS.name)
                ? TopCategoriasWidget(
                    title: "TOP 5 Livros",
                    categoria: EnumCategorias.LIVROS,
                  )
                : Text(""),
            resolverCategoriasVotadas(EnumCategorias.JOGOS.name)
                ? TopCategoriasWidget(
                    title: "TOP 5 Jogos",
                    categoria: EnumCategorias.JOGOS,
                  )
                : Text("")
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }

  bool resolverCategoriasVotadas(String categoria) {
    Future<List<Candidato>> futureCandidatos =
        DBProvider().findCandidatosByCategoria(categoria);
    List<Candidato> candidatos = [];
    futureCandidatos.then((value) {
      value.forEach((element) {
        if (element.voted == 1) {
          candidatos.add(element);
        }
      });
    });
    return candidatos.isEmpty;
  }
}
