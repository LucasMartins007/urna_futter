import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Musicas {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Lose Yourself",
      autor: "Eminem",
      imagem: "images/musicas/lose_yourself.jpeg",
      voted: 0,
      categoria: EnumCategorias.MUSICAS.name,
      numero: 123,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Alright",
      autor: "Kendrick Lamar",
      voted: 0,
      imagem: "images/musicas/alright.jpeg",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 456,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Ballin",
      autor: "Logic",
      voted: 0,
      imagem: "images/musicas/ballin.jpeg",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 789,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Aquele Abraço",
      autor: "Tim Maia",
      imagem: "images/musicas/aquele_abraco.jpeg",
      categoria: EnumCategorias.MUSICAS.name,
      voted: 0,
      numero: 1011,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Burguesinha",
      autor: "Seu Jorge",
      voted: 0,
      imagem: "images/musicas/burguesinha.jpeg",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 1012,
      qtdeVotos: 0,
    ),
  ];
}
