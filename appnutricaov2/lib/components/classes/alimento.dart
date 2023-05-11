const String tableAlimentos = 'Alimentos';

class AlimentosFields {

  static final List<String> values = [
    id, nome, pathFoto, categoria, tipo
  ];

  static const String id = '_id';
  static const String nome = 'nome';
  static const String pathFoto = 'pathFoto';
  static const String categoria = 'categoria';
  static const String tipo = 'tipo';
}



class Alimento {
  final int? id;
  String nome;
  String? pathFoto;
  String categoria;
  String tipo;

  Alimento(
      {
      this.id,
      required this.nome,
      this.pathFoto,
      required this.categoria,
      required this.tipo}
  );

  Map<String, Object?> toJson() => {
    AlimentosFields.id: id,
    AlimentosFields.nome: nome,
    AlimentosFields.pathFoto: pathFoto,
    AlimentosFields.categoria: categoria,
    AlimentosFields.tipo: tipo
  };

  Alimento copy({
    int? id,
    String? nome,
    String? pathFoto,
    String? categoria,
    String? tipo
  }) =>

  Alimento(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    pathFoto: pathFoto ?? this.pathFoto,
    categoria: categoria ?? this.categoria,
    tipo: tipo ?? this.tipo,
  );

  static Alimento fromJson(Map<String, Object?> json) => Alimento(
    id: json[AlimentosFields.id] as int?,
    nome: json[AlimentosFields.nome] as String, 
    pathFoto: json[AlimentosFields.pathFoto] as String, 
    categoria: json[AlimentosFields.categoria] as String, 
    tipo: json[AlimentosFields.tipo] as String);

}
