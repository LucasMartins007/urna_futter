import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/services/CandidatosService.dart';
import 'package:urna_eletrnonica/widget/ListCandidatosWidget.dart';

class CategoriasWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final double fontSite;
  final Icon leadingIcon;
  final EnumCategorias categoria;

  const CategoriasWidget(
      {Key? key,
      required this.fontSite,
      required this.title,
      required this.subTitle,
      required this.leadingIcon,
      required this.categoria})
      : super(key: key);

  @override
  State<CategoriasWidget> createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      minVerticalPadding: 15,
      horizontalTitleGap: 15,
      leading: widget.leadingIcon,
      onTap: () {
        CandidatoService().saveAll(widget.categoria);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ListCandidatosWidget(categoria: widget.categoria)));
      },
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: widget.fontSite,
        ),
      ),
      subtitle: Text(
        widget.subTitle,
      ),
    );
  }
}
