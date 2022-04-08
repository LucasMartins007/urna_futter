import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';
import 'package:urna_eletrnonica/services/CandidatosService.dart';
import 'package:urna_eletrnonica/widget/DialogWidget.dart';

class CardCandidatoWidget extends StatefulWidget {
  final String nome;
  final int numero;
  final String autor;
  final String urlImage;
  final int qtdeVotos;

  const CardCandidatoWidget({
    Key? key,
    required this.nome,
    required this.numero,
    required this.autor,
    required this.urlImage,
    required this.qtdeVotos,
  }) : super(key: key);

  @override
  _CardCandidatoWidgetState createState() => _CardCandidatoWidgetState();
}

class _CardCandidatoWidgetState extends State<CardCandidatoWidget> {
  int _qtdeVotos = 0;

  void _addVoto() {
    CandidatoService().adicionarVoto(widget.numero);

    DialogWidget().ConfirmDialogWidget(context, widget.nome);
    setState(() {
      _qtdeVotos++;
    });
  }



  @override
  void initState() {
    Future<List<Candidato>> candidatos =
        DBProvider().findCandidatosByNumero(widget.numero);
    candidatos.then((value) {
      _qtdeVotos = value.first.qtdeVotos;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Image.asset(
              widget.urlImage,
              fit: BoxFit.fill,
              width: 70,
              height: 60,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                    width: 130,
                    child: Text(
                      widget.nome.toUpperCase(),
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      widget.autor,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 10,
              top: MediaQuery.of(context).size.height / 12,
            ),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: _addVoto,
                  autofocus: true,
                  icon: Icon(
                    LineIcons.checkCircle,
                    color: Colors.white,
                  ),
                  label: Text("Votar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 0, 175, 6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
