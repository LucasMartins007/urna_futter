import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';
import 'package:urna_eletrnonica/widget/DrawerResultadoWidget.dart';

class ResultadoCategoriaScreen extends StatefulWidget {
  final String categoria;

  const ResultadoCategoriaScreen({Key? key, required this.categoria})
      : super(key: key);

  @override
  State<ResultadoCategoriaScreen> createState() =>
      _ResultadoCategoriaScreenState();
}

class _ResultadoCategoriaScreenState extends State<ResultadoCategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Resultados!"),
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
      drawer: DrawerResultadoWidget(),
      bottomSheet: FutureBuilder(
        future:
            DBProvider().findCandidatosByCategoria(EnumCategorias.OUTROS.name),
        builder: (context, AsyncSnapshot<List<Candidato>> snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.red[300],
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![0].qtdeVotos.toString() + " votos nulos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![1].qtdeVotos.toString() +
                            " votos em branco",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Text("Blash");
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.3,
            child: FutureBuilder(
              future: DBProvider().findCandidatosByCategoria(widget.categoria),
              builder: (context, AsyncSnapshot<List<Candidato>> snapshot) {
                if (snapshot.hasData) {
                  return resolverResultadosCandidatos(snapshot.data);
                }
                return Text("Blash");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget resolverResultadosCandidatos(List<Candidato>? candidatos) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return resolverResultados(candidatos, index);
      },
    );
  }

  Widget resolverResultados(List<Candidato>? candidatos, int index) {
    Candidato candidato = candidatos![index];

    return candidato.qtdeVotos == 0
        ? Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Text("O candidato " +
                candidato.nome.toUpperCase() +
                " ainda não possui votos. "),
          )
        : Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 25,
                        child: Text(
                          candidato.nome,
                          style: TextStyle(
                            fontSize: 17,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Votos: " + candidato.qtdeVotos.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Autor: " + candidato.autor,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                "Categoria: " +
                                    candidato.categoria
                                        .toString()
                                        .toLowerCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
