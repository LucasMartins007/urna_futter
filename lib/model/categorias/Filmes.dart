import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Filmes {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Vingadores Ultimato",
      autor: "Marvel",
      imagem: "images/filmes/vingadores.png",
      numero: 999,
      categoria: EnumCategorias.FILMES.name,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Homem Aranha 3",
      autor: "Marvel",
      imagem: "images/filmes/homem-aranha.png",
      categoria: EnumCategorias.FILMES.name,
      numero: 666,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Meu Malvado Favorito 2",
      autor: "DreamWorks",
      imagem: "images/filmes/malvado-favorito.png",
      categoria: EnumCategorias.FILMES.name,
      numero: 333,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Minions 2",
      autor: "DreamWorks",
      imagem: "images/filmes/minions.png",
      categoria: EnumCategorias.FILMES.name,
      numero: 111,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Madagascar 3",
      autor: "DreamWorks",
      imagem: "images/filmes/madagascar.png",
      categoria: EnumCategorias.FILMES.name,
      numero: 555,
      qtdeVotos: 0,
    ),
  ];
}
