import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';

class Jogos {
  List<Candidato> candidatos = [
    new Candidato(
      nome: "Shadow of Colossus",
      autor: "Sony",
      imagem: "images/jogos/shadow_colossus.jpeg",
      categoria: EnumCategorias.JOGOS.name,
      voted: 0,
      numero: 1000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "Horizon Dawn",
      autor: "Guerrilla Games",
      imagem: "images/jogos/horizon.jpeg",
      categoria: EnumCategorias.JOGOS.name,
      voted: 0,
      numero: 2000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "God of War 3",
      autor: "Sony",
      imagem: "images/jogos/god_of_war.jpeg",
      categoria: EnumCategorias.JOGOS.name,
      voted: 0,
      numero: 3000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "GTA 5",
      autor: "Rockstar",
      imagem: "images/jogos/gta.jpeg",
      categoria: EnumCategorias.JOGOS.name,
      voted: 0,
      numero: 4000,
      qtdeVotos: 0,
    ),
    new Candidato(
      nome: "BattleField",
      autor: "EAGames",
      imagem: "images/jogos/battleField.jpeg",
      categoria: EnumCategorias.JOGOS.name,
      voted: 0,
      numero: 5000,
      qtdeVotos: 0,
    ),
  ];
}
