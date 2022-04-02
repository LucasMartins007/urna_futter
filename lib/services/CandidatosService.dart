import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';

class CandidatoService {
  Future<List<Candidato>> buscarCanditadosPorCategoria(
      EnumCategorias categoria) async {
    if (EnumCategorias.ALL == categoria) {
      saveAll(EnumCategorias.FILMES);
      saveAll(EnumCategorias.JOGOS);
      saveAll(EnumCategorias.LIVROS);
      saveAll(EnumCategorias.MUSICAS);
      saveAll(EnumCategorias.SERIES);
      return DBProvider().findCandidatos();
    }
    return await DBProvider().findCandidatosByCategoria(categoria.name);
  }

  Future<List<Candidato>> buscarCanditados() async {
    return await DBProvider().findCandidatos();
  }

  void saveAll(EnumCategorias categoria) {
    List<Candidato> candidatos = CategoriasHelper().getValue(categoria);

    Future<List<Candidato>> futureCandidatos =
        buscarCanditadosPorCategoria(categoria);

    futureCandidatos.then((value) {
      if (value.isEmpty) {
        if (candidatos.length <= 5) {
          candidatos.forEach((candidato) => DBProvider().addItem(candidato));
        }
      }
    });
  }

  Future<List<Candidato>> resolverCandidatos(EnumCategorias categoria) {
    this.saveAll(categoria);
    return this.buscarCanditadosPorCategoria(categoria);
  }

  void adicionarVoto(int numeroCandidato) {
    print(numeroCandidato);
    Future<List<Candidato>> candidatos =
        DBProvider().findCandidatosByNumero(numeroCandidato);

    candidatos.then((value) {
      Candidato candidato = value.first;
      candidato.qtdeVotos++;
      DBProvider().updateCandidato(candidato.id!, candidato);
    });
  }
}
