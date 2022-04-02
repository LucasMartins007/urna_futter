import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Musicas {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Lose Yourself",
      autor: "Eminem",
      imagem: "images/musicas/lose-yourself.png",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 123,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Alright",
      autor: "Kendrick Lamar",
      imagem: "images/musicas/alright.png",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 456,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Ballin",
      autor: "Logic",
      imagem: "images/musicas/ballin.png",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 789,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Aquele Abraço",
      autor: "Tim Maia",
      imagem: "images/musicas/aquele-abraco.png",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 1011,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Burguesinha",
      autor: "Seu Jorge",
      imagem: "images/musicas/burgesinha.png",
      categoria: EnumCategorias.MUSICAS.name,
      numero: 1012,
      qtdeVotos: 0,
    ),
  ];
}
