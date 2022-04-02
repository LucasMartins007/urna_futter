import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Jogos {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Shadow of Colossus",
      autor: "Sony",
      imagem: "images/jogos/shadow-colossus.png",
      categoria: EnumCategorias.JOGOS.name,
      numero: 1000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Horizon Dawn",
      autor: "Guerrilla Games",
      imagem: "images/jogos/horizon.png",
      categoria: EnumCategorias.JOGOS.name,
      numero: 2000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "God of War 3",
      autor: "Sony",
      imagem: "images/jogos/sony.png",
      categoria: EnumCategorias.JOGOS.name,
      numero: 3000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "GTA 5",
      autor: "Rockstar",
      imagem: "images/jogos/gta.png",
      categoria: EnumCategorias.JOGOS.name,
      numero: 4000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "BattleField",
      autor: "EAGames",
      imagem: "images/jogos/battleField.png",
      categoria: EnumCategorias.JOGOS.name,
      numero: 5000,
      qtdeVotos: 0,
    ),
  ];
}
