
const String tableAlimentos = 'Alimentos';

class AlimentosFields {

  static final List<String> values = [
    nome, fotoBytes, categoria, tipo
  ];

  static const String nome = 'nome';
  static const String fotoBytes = 'fotoBytes';
  static const String categoria = 'categoria';
  static const String tipo = 'tipo';
}



class Alimento {
  String nome;
  String fotoBytes;
  String categoria;
  String tipo;

  Alimento(
      {
      required this.nome,
      required this.fotoBytes,
      required this.categoria,
      required this.tipo}
  );

  Map<String, dynamic> toJson() => {
    AlimentosFields.nome: nome,
    AlimentosFields.fotoBytes: fotoBytes,
    AlimentosFields.categoria: categoria,
    AlimentosFields.tipo: tipo
  };

  Alimento copy({
    String? nome,
    String? fotoBytes,
    String? categoria,
    String? tipo
  }) =>

  Alimento(
    nome: nome ?? this.nome,
    fotoBytes: fotoBytes ?? this.fotoBytes,
    categoria: categoria ?? this.categoria,
    tipo: tipo ?? this.tipo,
  );

  static Alimento fromJson(Map<String, dynamic> json) => Alimento(
    nome: json[AlimentosFields.nome] as String, 
    fotoBytes: json[AlimentosFields.fotoBytes] as String, 
    categoria: json[AlimentosFields.categoria] as String, 
    tipo: json[AlimentosFields.tipo] as String);

}

