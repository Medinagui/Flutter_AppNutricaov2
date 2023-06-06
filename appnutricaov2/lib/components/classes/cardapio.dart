const String tableCardapio = 'cardapio';

class CardapioFields {
  static const String name = 'name';
  static const String cafeId1 = 'cafeId1';
  static const String cafeNome1 = 'cafeNome1';
  static const String cafeId2 = 'cafeId2';
  static const String cafeNome2 = 'cafeNome2';
  static const String cafeId3 = 'cafeId3';
  static const String cafeNome3 = 'cafeNome';
  static const String almocoId1 = 'almocoId1';
  static const String almocoNome1 = 'almocoNome1';
  static const String almocoId2 = 'almocoId2';
  static const String almocoNome2 = 'almocoNome2';
  static const String almocoId3 = 'almocoId3';
  static const String almocoNome3 = 'almocoNome3';
  static const String almocoId4 = 'almocoId4';
  static const String almocoNome4 = 'almocoNome4';
  static const String almocoId5 = 'almocoId5';
  static const String almocoNome5 = 'almocoNome5';
  static const String jantarId1 = 'jantarId1';
  static const String jantarNome1 = 'jantarNome1';
  static const String jantarId2 = 'jantarId2';
  static const String jantarNome2 = 'jantarNome2';
  static const String jantarId3 = 'jantarId3';
  static const String jantarNome3 = 'jantarNome3';
  static const String jantarId4 = 'jantarId4';
  static const String jantarNome4 = 'jantarNome4';
}

class Cardapio {
  String name;
  int cafeId1;
  String cafeNome1;
  int cafeId2;
  String cafeNome2;
  int cafeId3;
  String cafeNome3;
  int almocoId1;
  String almocoNome1;
  int almocoId2;
  String almocoNome2;
  int almocoId3;
  String almocoNome3;
  int almocoId4;
  String almocoNome4;
  int almocoId5;
  String almocoNome5;
  int jantarId1;
  String jantarNome1;
  int jantarId2;
  String jantarNome2;
  int jantarId3;
  String jantarNome3;
  int jantarId4;
  String jantarNome4;

  Cardapio(
      {required this.name,
      required this.cafeId1,
      required this.cafeNome1,
      required this.cafeId2,
      required this.cafeNome2,
      required this.cafeId3,
      required this.cafeNome3,
      required this.almocoId1,
      required this.almocoNome1,
      required this.almocoId2,
      required this.almocoNome2,
      required this.almocoId3,
      required this.almocoNome3,
      required this.almocoId4,
      required this.almocoNome4,
      required this.almocoId5,
      required this.almocoNome5,
      required this.jantarId1,
      required this.jantarNome1,
      required this.jantarId2,
      required this.jantarNome2,
      required this.jantarId3,
      required this.jantarNome3,
      required this.jantarId4,
      required this.jantarNome4});

  Map<String, dynamic> toJson() => {
        CardapioFields.name: name,
        CardapioFields.cafeId1: cafeId1,
        CardapioFields.cafeNome1: cafeNome1,
        CardapioFields.cafeId2: cafeId2,
        CardapioFields.cafeNome2: cafeNome2,
        CardapioFields.cafeId3: cafeId3,
        CardapioFields.cafeNome3: cafeNome3,
        CardapioFields.almocoId1: almocoId1,
        CardapioFields.almocoNome1: almocoNome1,
        CardapioFields.almocoId2: almocoId2,
        CardapioFields.almocoNome2: almocoNome2,
        CardapioFields.almocoId3: almocoId3,
        CardapioFields.almocoNome3: almocoNome3,
        CardapioFields.almocoId4: almocoId4,
        CardapioFields.almocoNome4: almocoNome4,
        CardapioFields.almocoId5: almocoId5,
        CardapioFields.almocoNome5: almocoNome5,
        CardapioFields.jantarId1: jantarId1,
        CardapioFields.jantarNome1: jantarNome1,
        CardapioFields.jantarId2: jantarId2,
        CardapioFields.jantarNome2: jantarNome2,
        CardapioFields.jantarId3: jantarId3,
        CardapioFields.jantarNome3: jantarNome3,
        CardapioFields.jantarId4: jantarId4,
        CardapioFields.jantarNome4: jantarNome4
      };

  Cardapio copy({
    String? name,
  }) =>
      Cardapio(
          name: name ?? this.name,
          cafeId1: cafeId1,
          cafeNome1: cafeNome1,
          cafeId2: cafeId2,
          cafeNome2: cafeNome2,
          cafeId3: cafeId3,
          cafeNome3: cafeNome3,
          almocoId1: almocoId1,
          almocoNome1: almocoNome1,
          almocoId2: almocoId2,
          almocoNome2: almocoNome2,
          almocoId3: almocoId3,
          almocoNome3: almocoNome3,
          almocoId4: almocoId4,
          almocoNome4: almocoNome4,
          almocoId5: almocoId5,
          almocoNome5: almocoNome5,
          jantarId1: jantarId1,
          jantarNome1: jantarNome1,
          jantarId2: jantarId2,
          jantarNome2: jantarNome2,
          jantarId3: jantarId3,
          jantarNome3: jantarNome3,
          jantarId4: jantarId4,
          jantarNome4: jantarNome4
          );

  static Cardapio fromJson(Map<String, dynamic> json) => Cardapio(
        name: json[CardapioFields.name] as String,
          cafeId1: json[CardapioFields.cafeId1] as int,
          cafeNome1: json[CardapioFields.cafeNome1] as String,
          cafeId2: json[CardapioFields.cafeId2] as int,
          cafeNome2: json[CardapioFields.cafeNome2] as String,
          cafeId3: json[CardapioFields.cafeId3] as int,
          cafeNome3: json[CardapioFields.cafeNome3] as String,
          almocoId1: json[CardapioFields.almocoId1] as int,
          almocoNome1: json[CardapioFields.almocoNome1] as String,
          almocoId2: json[CardapioFields.almocoId2] as int,
          almocoNome2: json[CardapioFields.almocoNome2] as String,
          almocoId3: json[CardapioFields.almocoId3] as int,
          almocoNome3: json[CardapioFields.almocoNome3] as String,
          almocoId4: json[CardapioFields.almocoId4] as int,
          almocoNome4: json[CardapioFields.almocoNome4] as String,
          almocoId5: json[CardapioFields.almocoId5] as int,
          almocoNome5: json[CardapioFields.almocoNome5] as String,
          jantarId1: json[CardapioFields.jantarId1] as int,
          jantarNome1: json[CardapioFields.jantarNome1] as String,
          jantarId2: json[CardapioFields.jantarId2] as int,
          jantarNome2: json[CardapioFields.jantarNome2] as String,
          jantarId3: json[CardapioFields.jantarId3] as int,
          jantarNome3: json[CardapioFields.jantarNome3] as String,
          jantarId4: json[CardapioFields.jantarId4] as int,
          jantarNome4: json[CardapioFields.jantarNome4] as String
      );
}
