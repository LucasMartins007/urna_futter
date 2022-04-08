import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/screens/HomeScreen.dart';
import 'package:urna_eletrnonica/screens/ResultadoCategoriaScreen.dart';
import 'package:urna_eletrnonica/screens/ResultadosScreen.dart';
import 'package:line_icons/line_icons.dart';

import '../model/enum/EnumCategorias.dart';

class DrawerResultadoWidget extends StatelessWidget {
  const DrawerResultadoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100,
      semanticLabel: "Categorias",
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.easeInOutCirc,
            duration: Duration(seconds: 5),
            padding: EdgeInsets.only(top: 100, left: 70),
            child: Text(
              'Resultados',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.justify,
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue[600]!,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
              ),
              border: Border(
                bottom: BorderSide.none,
                right: BorderSide.none,
              ),
            ),
          ),
          ListTile(
            isThreeLine: true,
            minVerticalPadding: 15,
            horizontalTitleGap: 15,
            leading: Icon(Icons.movie_creation_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoCategoriaScreen(
                            categoria: EnumCategorias.MUSICAS.name,
                          )));
            },
            title: Text(
              "Musicas",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Veja o andamento da votação para as melhores músicas!",
            ),
          ),
          ListTile(
            isThreeLine: true,
            minVerticalPadding: 15,
            horizontalTitleGap: 15,
            leading: Icon(Icons.people_outline),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoCategoriaScreen(
                            categoria: EnumCategorias.SERIES.name,
                          )));
            },
            title: Text(
              "Séries",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Veja o andamento da votação para as melhores Séries!",
            ),
          ),
          ListTile(
            isThreeLine: true,
            minVerticalPadding: 15,
            horizontalTitleGap: 15,
            leading: Icon(Icons.book_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoCategoriaScreen(
                            categoria: EnumCategorias.LIVROS.name,
                          )));
            },
            title: Text(
              "Livros",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Veja o andamento da votação para os melhores livros!",
            ),
          ),
          ListTile(
            isThreeLine: true,
            minVerticalPadding: 15,
            horizontalTitleGap: 15,
            leading: Icon(Icons.movie_creation_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoCategoriaScreen(
                            categoria: EnumCategorias.FILMES.name,
                          )));
            },
            title: Text(
              "Filmes",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Veja o andamento da votação para os melhores filmes!",
            ),
          ),
          ListTile(
            isThreeLine: true,
            minVerticalPadding: 15,
            horizontalTitleGap: 15,
            leading: Icon(Icons.videogame_asset),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoCategoriaScreen(
                            categoria: EnumCategorias.JOGOS.name,
                          )));
            },
            title: Text(
              "Jogos",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Veja o andamento da votação para os melhores filmes!",
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(bottom: 20),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultadosScreen(),
                  ),
                );
              },
              autofocus: true,
              icon: Icon(
                LineIcons.checkCircle,
                color: Colors.green,
              ),
              label: Text("Vencedores de cada categoria!",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[300]),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              autofocus: true,
              icon: Icon(
                LineIcons.arrowCircleRight,
                color: Colors.green,
              ),
              label: Text("Continuar Votação!",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan[100]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
