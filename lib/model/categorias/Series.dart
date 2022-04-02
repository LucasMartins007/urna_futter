import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Series {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Naruto",
      autor: "Masashi Kishimoto",
      imagem: "images/series/naruto.png",
      categoria: EnumCategorias.SERIES.name,
      numero: 60,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "One Piece",
      autor: "Eiichiro Oda",
      imagem: "images/series/one-piece.png",
      categoria: EnumCategorias.SERIES.name,
      numero: 13,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Brooklyn 99",
      autor: "Dan Goor",
      imagem: "images/series/broklyn.png",
      categoria: EnumCategorias.SERIES.name,
      numero: 14,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Todo mundo odeia o Chris",
      autor: "Chris Rock",
      imagem: "images/series/chris.png",
      categoria: EnumCategorias.SERIES.name,
      numero: 15,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dragon Ball Z",
      autor: "Akira Toriyama",
      imagem: "images/series/dbz.png",
      categoria: EnumCategorias.SERIES.name,
      numero: 16,
      qtdeVotos: 0,
    ),
  ];
}
