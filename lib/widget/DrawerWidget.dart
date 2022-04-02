import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/ResultadosScreen.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:line_icons/line_icons.dart';
import 'package:urna_eletrnonica/widget/CategoriasWidget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100,
      semanticLabel: "Categorias",
      child: ListView(children: [
        DrawerHeader(
          curve: Curves.easeInOutCirc,
          duration: Duration(seconds: 5),
          padding: EdgeInsets.only(top: 100, left: 70),
          child: Text(
            'Categorias',
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
              )),
        ),
        CategoriasWidget(
          fontSite: 20,
          title: "Melhores Filmes",
          subTitle: "Vote nos melhores filmes que vc já assistiu!",
          leadingIcon: Icon(Icons.ac_unit_outlined),
          categoria: EnumCategorias.FILMES,
        ),
        CategoriasWidget(
          fontSite: 20,
          title: "Melhores Músicas",
          subTitle: "Vote nas melhores músicas que vc já ouviu!",
          leadingIcon: Icon(Icons.music_note_outlined),
          categoria: EnumCategorias.MUSICAS,
        ),
        CategoriasWidget(
          fontSite: 20,
          title: "Melhores Jogos",
          subTitle: "Vote nos seus melhores jogos que você já jogou!",
          leadingIcon: Icon(Icons.games_rounded),
          categoria: EnumCategorias.JOGOS,
        ),
        CategoriasWidget(
          leadingIcon: Icon(Icons.book_sharp),
          fontSite: 20,
          title: "Melhores Livros",
          subTitle: "Vote nos seus melhores livros que você já leu!",
          categoria: EnumCategorias.LIVROS,
        ),
        CategoriasWidget(
          leadingIcon: Icon(Icons.move_to_inbox_outlined),
          fontSite: 20,
          title: "Melhores Séries",
          subTitle: "Vote nas melhors series que vc já assistiu!",
          categoria: EnumCategorias.SERIES,
        ),
        Container(
          width: 50,
          height: 100,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/resultado",
              );
            },
            autofocus: true,
            icon: Icon(
              LineIcons.checkCircle,
              color: Colors.green,
            ),
            label: Text("Visualizar Resultados",
                style: TextStyle(
                  color: Colors.black,
                )),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.cyan[100]),
            ),
          ),
        ),
      ]),
    );
  }
}
