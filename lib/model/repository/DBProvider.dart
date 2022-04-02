import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:urna_eletrnonica/model/candidatos.dart';

class DBProvider {
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'urna.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE candidato(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          autor TEXT,
          categoria TEXT,
          numero INTEGER,
          qtdeVotos INTEGER,
          imagem string)""");
    });
  }

  Future<int> addItem(Candidato candidato) async {
    final db = await init();
    return db.insert(
      "candidato",
      candidato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Candidato>> findCandidatosByCategoria(String categoria) async {
    final db = await init();
    List<Map<String, Object?>> maps = await db.query(
      "candidato",
      where: "categoria = ?",
      whereArgs: [categoria],
    );

    return List.generate(maps.length, (i) {
      return Candidato.fromJson(maps[i]);
    });
  }

  Future<List<Candidato>> findCandidatosByNumero(int numero) async {
    final db = await init();
    List<Map<String, Object?>> maps = await db.query(
      "candidato",
      where: "numero = ?",
      whereArgs: [numero],
    );

    return List.generate(maps.length, (i) {
      return Candidato.fromJson(maps[i]);
    });
  }

  Future<List<Candidato>> findCandidatos() async {
    final db = await init();
    List<Map<String, Object?>> maps = await db.query("candidato");

    return List.generate(maps.length, (i) {
      return Candidato.fromJson(maps[i]);
    });
  }

  Future<int> updateCandidato(int id, Candidato item) async {
    final db = await init();

    int result = await db.update(
      "candidato",
      item.toMap(),
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }
}
