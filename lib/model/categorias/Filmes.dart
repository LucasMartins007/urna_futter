import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Filmes {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Vingadores Ultimato",
      autor: "Marvel",
      imagem: "images/filmes/vingadores.jpeg",
      numero: 999,
      categoria: EnumCategorias.FILMES.name,
      voted: 0,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Homem Aranha 3",
      autor: "Marvel",
      imagem: "images/filmes/homem_aranha.jpeg",
      categoria: EnumCategorias.FILMES.name,
      voted: 0,
      numero: 666,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Meu Malvado Favorito 2",
      autor: "DreamWorks",
      imagem: "images/filmes/meu_malvado_favorito.jpeg",
      categoria: EnumCategorias.FILMES.name,
      voted: 0,
      numero: 333,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Minions 2",
      autor: "DreamWorks",
      imagem: "images/filmes/minions.jpeg",
      categoria: EnumCategorias.FILMES.name,
      voted: 0,
      numero: 111,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Madagascar 3",
      autor: "DreamWorks",
      imagem: "images/filmes/madagascar.jpg",
      categoria: EnumCategorias.FILMES.name,
      voted: 0,
      numero: 555,
      qtdeVotos: 0,
    ),
  ];
}
