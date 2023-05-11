import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../components/classes/alimento.dart';

class AlimentosDatabase {
  static final AlimentosDatabase instance = AlimentosDatabase._init();

  static Database? _database;

  AlimentosDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('alimentos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    return await openDatabase(filePath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT';

    await db.execute(
      '''
CREATE TABLE $tableAlimentos (
  ${AlimentosFields.id} $idType,
  ${AlimentosFields.nome} $textType,
  ${AlimentosFields.pathFoto} $textType,
  ${AlimentosFields.categoria} $textType,
  ${AlimentosFields.tipo} $textType)
''');
  }

  // temp init

  Future dropDB() async {
    final db = await instance.database;
    db.rawQuery("DROP DATABASE alimentos.db");
  }

  Future<void> dropTableIfExistsThenReCreate() async {
    Database db = await _initDB('alimentos.db');
    await db.execute("DROP TABLE IF EXISTS $tableAlimentos");
    await _createDB(db, 1);
  }

  // temp final

  Future<Alimento> create(Alimento alimento) async {
    final db = await instance.database;
    final id = await db.insert(tableAlimentos, alimento.toJson());
    return alimento.copy(id: id);
  }

  Future<Alimento> readAlimento(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableAlimentos,
        columns: AlimentosFields.values,
        where: '${AlimentosFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Alimento.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<Alimento>> readAllAlimentos() async {
    
    final db = await instance.database;
    const orderBy = '${AlimentosFields.id} ASC';
    final result = await db.query(tableAlimentos, orderBy: orderBy);
    final resultList = result.map((json) => Alimento.fromJson(json)).toList();
    return resultList;
  }

  Future<int> update(Alimento alimento) async {
    final db = await instance.database;
    return db.update(tableAlimentos, alimento.toJson(),
        where: '${AlimentosFields.id} = ?', whereArgs: [alimento.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return  await db.delete(tableAlimentos,
        where: '${AlimentosFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
