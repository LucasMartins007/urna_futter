import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Livros {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Orgulho e Preconceito",
      autor: "Jane Austen",
      imagem: "images/livros/orgulho-preconceito.png",
      categoria: EnumCategorias.LIVROS.name,
      numero: 12,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "1984",
      autor: "George Orwell",
      imagem: "images/livros/1984.png",
      categoria: EnumCategorias.LIVROS.name,
      numero: 13,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dom Quixote de la Mancha",
      autor: "Miguel de Cervantes",
      imagem: "images/livros/dom-quixote.png",
      categoria: EnumCategorias.LIVROS.name,
      numero: 14,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "O Pequeno Príncipe",
      autor: "Antoine de Saint-Exupéry",
      imagem: "images/livros/pequeno-principe.png",
      categoria: EnumCategorias.LIVROS.name,
      numero: 15,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dom Casmurro",
      autor: "Machado de Assis",
      imagem: "images/livros/dom-casmurro.png",
      categoria: EnumCategorias.LIVROS.name,
      numero: 16,
      qtdeVotos: 0,
    ),
  ];
}
