import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/services/CandidatosService.dart';
import 'package:urna_eletrnonica/widget/CardCandidatoWidget.dart';
import 'package:urna_eletrnonica/widget/DialogWidget.dart';

class ListCandidatosWidget extends StatefulWidget {
  final EnumCategorias categoria;

  const ListCandidatosWidget({
    Key? key,
    required this.categoria,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ListCandidatosWidget>
    with SingleTickerProviderStateMixin {
  Future<List<Candidato>> buscarCandidatos() async {
    return await CandidatoService()
        .buscarCanditadosPorCategoria(widget.categoria);
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.categoria != EnumCategorias.ALL
        ? widget.categoria.name
        : "Urna de popularidade!";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
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
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder(
          initialData: CategoriasHelper().getValue(widget.categoria),
          future: buscarCandidatos(),
          builder: (context, AsyncSnapshot<List<Candidato>> snapshot) {
            if (snapshot.hasData) {
              List<Candidato> candidatos = snapshot.data!;
              return ListView.builder(
                itemCount: candidatos.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          CardCandidatoWidget(
                            nome: candidatos[index].nome,
                            numero: candidatos[index].numero,
                            autor: candidatos[index].autor,
                            qtdeVotos: candidatos[index].qtdeVotos,
                            urlImage: candidatos[index].imagem,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    CandidatoService().adicionarVoto(0);
                    DialogWidget().ConfirmDialogWidget(context, "Branco");
                  },
                  child: Text(
                    "Branco",
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
                  onPressed: () {
                    CandidatoService().adicionarVoto(1);
                    DialogWidget().ConfirmDialogWidget(context, "Nulo");
                  },
                  child: Text(
                    "Anular",
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
        ),
      ),
    );
  }
}
