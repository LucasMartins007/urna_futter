import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/screens/HomeScreen.dart';
import 'package:line_icons/line_icons.dart';

class DialogWidget{
void ConfirmDialogWidget(BuildContext context, String nome) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: [
          ElevatedButton.icon(
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
              LineIcons.userCheck,
              color: Colors.white,
            ),
            label: Text("Finalizar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        ],
        title: Text("Você votou em " + nome + "!"),
        titlePadding: EdgeInsets.all(30),
      );
    },
  );
}
}