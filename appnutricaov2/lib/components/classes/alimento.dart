
const String tableAlimentos = 'Alimentos';

class AlimentosFields {

  static final List<String> values = [
    id, nome, fotoBytes, categoria, tipo
  ];

  static const String id = 'id';
  static const String nome = 'nome';
  static const String fotoBytes = 'fotoBytes';
  static const String categoria = 'categoria';
  static const String tipo = 'tipo';
}



class Alimento {
  final int? id;
  String nome;
  String? fotoBytes;
  String categoria;
  String tipo;

  Alimento(
      {
      this.id,
      required this.nome,
      this.fotoBytes,
      required this.categoria,
      required this.tipo}
  );

  Map<String, dynamic> toJson() => {
    AlimentosFields.id: id,
    AlimentosFields.nome: nome,
    AlimentosFields.fotoBytes: fotoBytes,
    AlimentosFields.categoria: categoria,
    AlimentosFields.tipo: tipo
  };

  Alimento copy({
    int? id,
    String? nome,
    String? fotoBytes,
    String? categoria,
    String? tipo
  }) =>

  Alimento(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    fotoBytes: fotoBytes ?? this.fotoBytes,
    categoria: categoria ?? this.categoria,
    tipo: tipo ?? this.tipo,
  );

  static Alimento fromJson(Map<String, dynamic> json) => Alimento(
    id: json[AlimentosFields.id] as int?,
    nome: json[AlimentosFields.nome] as String, 
    fotoBytes: json[AlimentosFields.fotoBytes] as String, 
    categoria: json[AlimentosFields.categoria] as String, 
    tipo: json[AlimentosFields.tipo] as String);

}

