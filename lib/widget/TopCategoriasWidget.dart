import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/screens/ListCandidatosWidget.dart';
import 'package:urna_eletrnonica/services/CandidatosService.dart';

class TopCategoriasWidget extends StatelessWidget {
  final String title;
  final EnumCategorias categoria;


  const TopCategoriasWidget({
    Key? key,
    required this.title,
    required this.categoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(
        top: 20,
        bottom: 15,
        left: 15,
      ),
      alignment: Alignment.centerLeft,
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
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 5,
            ),
            child: ElevatedButton(
              onPressed: () {
                CandidatoService().saveAll(this.categoria);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ListCandidatosWidget(categoria: this.categoria),
                  ),
                );
              },
              child: Text("Iniciar Votação"),
            ),
          )
        ],
      ),
    );
  }
}
