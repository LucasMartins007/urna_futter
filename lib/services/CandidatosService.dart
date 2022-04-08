import 'package:urna_eletrnonica/model/candidatos.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/model/repository/DBProvider.dart';

class CandidatoService {
  Future<List<Candidato>> buscarCanditadosPorCategoria(
      EnumCategorias categoria) async {
    return await DBProvider().findCandidatosByCategoria(categoria.name);
  }

  Future<List<Candidato>> buscarCanditados() async {
    return await DBProvider().findCandidatos();
  }

  void saveAll(EnumCategorias categoria) {
    Future<List<Candidato>> future =
        DBProvider().findCandidatosByCategoria(categoria.name);
    future.then((value) {
      if (value.isEmpty) {
        List<Candidato> candidatos = CategoriasHelper().getValue(EnumCategorias.ALL);

        candidatos.forEach((element) {
          DBProvider().addItem(element);
        });
      }
    });
  }

  void adicionarVoto(int numeroCandidato) {
    print(numeroCandidato);
    Future<List<Candidato>> candidatos =
        DBProvider().findCandidatosByNumero(numeroCandidato);

    candidatos.then((value) {
      Candidato candidato = value.first;
      candidato.qtdeVotos++;
      candidato.voted = 1;
      DBProvider().updateCandidato(candidato.id!, candidato);
    });
  }
}
