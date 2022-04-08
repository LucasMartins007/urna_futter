import 'package:flutter/material.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/categorias/Filmes.dart';
import 'package:urna_eletrnonica/model/categorias/Jogos.dart';
import 'package:urna_eletrnonica/model/categorias/Livros.dart';
import 'package:urna_eletrnonica/model/categorias/Musicas.dart';
import 'package:urna_eletrnonica/model/categorias/Series.dart';

import '../categorias/Outros.dart';

enum EnumCategorias {
  LIVROS,
  FILMES,
  MUSICAS,
  JOGOS,
  SERIES,
  OUTROS,
  ALL,
}

class CategoriasHelper {
  List<Candidato> getValue(EnumCategorias categoria) {
    switch (categoria) {
      case EnumCategorias.FILMES:
        return Filmes().candidatos;

      case EnumCategorias.MUSICAS:
        return Musicas().candidatos;

      case EnumCategorias.JOGOS:
        return Jogos().candidatos;

      case EnumCategorias.LIVROS:
        return Livros().candidatos;

      case EnumCategorias.SERIES:
        return Series().candidatos;

      case EnumCategorias.OUTROS:
        return Outros().candidatos;

      case EnumCategorias.ALL:
        List<Candidato> candidatos = [];
        candidatos.addAll(Series().candidatos);
        candidatos.addAll(Livros().candidatos);
        candidatos.addAll(Jogos().candidatos);
        candidatos.addAll(Musicas().candidatos);
        candidatos.addAll(Filmes().candidatos);
        candidatos.addAll(Outros().candidatos);

        return candidatos;
      default:
        return [];
    }
  }
}
