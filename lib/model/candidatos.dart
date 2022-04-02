class Candidato {
  final int? id;
  final String nome;
  final String autor;
  final int numero;
  int qtdeVotos;
  final String categoria;
  final String imagem;

  Candidato({
    this.id,
    required this.nome,
    required this.autor,
    required this.imagem,
    required this.numero,
    required this.categoria,
    required this.qtdeVotos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "nome": nome,
      "autor": autor,
      "numero": numero,
      "categoria": categoria,
      "qtdeVotos": qtdeVotos,
      "imagem": imagem,
    };
  }

  factory Candidato.fromJson(Map<String, dynamic> parsedJson) {
    return Candidato(
      id: parsedJson['id'],
      nome: parsedJson['nome'],
      autor: parsedJson['autor'],
      numero: parsedJson['numero'],
      categoria: parsedJson['categoria'],
      qtdeVotos: parsedJson['qtdeVotos'],
      imagem: parsedJson['imagem'],
    );
  }
}
