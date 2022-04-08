import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Series {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Naruto",
      autor: "Masashi Kishimoto",
      imagem: "images/series/naruto.jpeg",
      categoria: EnumCategorias.SERIES.name,
      voted: 0,
      numero: 60,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "One Piece",
      autor: "Eiichiro Oda",
      voted: 0,
      imagem: "images/series/one_piece.jpeg",
      categoria: EnumCategorias.SERIES.name,
      numero: 13,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Brooklyn 99",
      autor: "Dan Goor",
      voted: 0,
      imagem: "images/series/brooklyn_99.jpeg",
      categoria: EnumCategorias.SERIES.name,
      numero: 14,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Todo mundo odeia o Chris",
      autor: "Chris Rock",
      imagem: "images/series/chris.jpeg",
      voted: 0,
      categoria: EnumCategorias.SERIES.name,
      numero: 15,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dragon Ball Z",
      autor: "Akira Toriyama",
      imagem: "images/series/dbz.jpeg",
      voted: 0,
      categoria: EnumCategorias.SERIES.name,
      numero: 16,
      qtdeVotos: 0,
    ),
  ];
}
