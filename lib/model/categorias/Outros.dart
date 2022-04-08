import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Outros {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "BRANCO",
      autor: "BRANCO",
      imagem: "BRANCO",
      numero: 0,
      voted: 0,
      categoria: EnumCategorias.OUTROS.name,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "NULO",
      autor: "NULO",
      imagem: "NULO",
      numero: 1,
      voted: 0,
      categoria: EnumCategorias.OUTROS.name,
      qtdeVotos: 0,
    ),
  ];
}
