import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';
import 'package:urna_eletrnonica/widget/DrawerResultadoWidget.dart';
import 'package:urna_eletrnonica/widget/TopCategoriasWidget.dart';

class ResultadosScreen extends StatefulWidget {
  const ResultadosScreen({Key? key}) : super(key: key);

  @override
  State<ResultadosScreen> createState() => _ResultadosScreenState();
}

class _ResultadosScreenState extends State<ResultadosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vencedores!"),
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
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![0].qtdeVotos.toString() + " votos em branco",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.red[300],
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![1].qtdeVotos.toString() +
                            " votos nulos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
      body: ListView(
        children: [
          mostarCardVencedor(EnumCategorias.MUSICAS, "Musica mais votada: "),
          mostarCardVencedor(EnumCategorias.SERIES, "Série mais votada: "),
          mostarCardVencedor(EnumCategorias.LIVROS, "Livro mais votado: "),
          mostarCardVencedor(EnumCategorias.FILMES, "Filme mais votado: "),
          mostarCardVencedor(EnumCategorias.JOGOS, "Jogos mais votado: "),
        ],
      ),
    );
  }

  Widget resolverResultadosCandidatos(Candidato candidatoVencedor) {
    return Container(
      child: candidatoVencedor.qtdeVotos == 0
          ? Container(
              alignment: Alignment.centerLeft,
              child: Text("A categoria " +
                  candidatoVencedor.categoria.toLowerCase() +
                  " ainda não possui votos. "),
            )
          : Column(
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
                          candidatoVencedor.nome,
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
                        "Votos: " + candidatoVencedor.qtdeVotos.toString(),
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
                                "Autor: " + candidatoVencedor.autor,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                "Categoria: " +
                                    candidatoVencedor.categoria
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

  Widget resolverResultados(List<Candidato>? candidatos, int index) {
    switch (candidatos![index].categoria) {
      case "MUSICAS":
        Candidato candidato = candidatos[index];

        return Container(
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
                                  candidato.categoria.toString().toLowerCase(),
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

      case "JOGOS":
        return Text("Jogos: " + candidatos[index].nome);

      case "FILMES":
        return Text("Filmes: " + candidatos[index].nome);

      case "SERIES":
        return Text("Series: " + candidatos[index].nome);

      case "LIVROS":
        return Text("Livros: " + candidatos[index].nome);

      case "OUTROS":
        return Text("Outros: " + candidatos[index].nome);
    }
    return Text("Series: " + candidatos[index].nome);
  }

  Container mostarCardVencedor(EnumCategorias categoria, String titulo) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
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
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              titulo,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          FutureBuilder(
            future: DBProvider().findCandidatosVencedor(categoria.name),
            builder: (context, AsyncSnapshot<List<Candidato>> snapshot) {
              if (snapshot.hasData) {
                Candidato candidatoVencedor = snapshot.data!.first;

                return resolverResultadosCandidatos(candidatoVencedor);
              }
              return Text("");
            },
          ),
        ],
      ),
    );
  }
}
