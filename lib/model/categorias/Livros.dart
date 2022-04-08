import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Livros {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Orgulho e Preconceito",
      autor: "Jane Austen",
      imagem: "images/livros/orgulho_preconceito.jpeg",
      categoria: EnumCategorias.LIVROS.name,
      voted: 0,
      numero: 12,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "1984",
      autor: "George Orwell",
      imagem: "images/livros/1984.jpeg",
      categoria: EnumCategorias.LIVROS.name,
      voted: 0,
      numero: 13,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dom Quixote de la Mancha",
      autor: "Miguel de Cervantes",
      imagem: "images/livros/dom_quixote.jpeg",
      categoria: EnumCategorias.LIVROS.name,
      numero: 14,
      voted: 0,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "O Pequeno Príncipe",
      autor: "Antoine de Saint-Exupéry",
      imagem: "images/livros/pequeno_principe.jpeg",
      categoria: EnumCategorias.LIVROS.name,
      numero: 15,
      voted: 0,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Dom Casmurro",
      autor: "Machado de Assis",
      imagem: "images/livros/dom_casmurro.jpeg",
      categoria: EnumCategorias.LIVROS.name,
      numero: 16,
      voted: 0,
      qtdeVotos: 0,
    ),
  ];
}
