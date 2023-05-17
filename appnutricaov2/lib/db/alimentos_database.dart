import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import '../components/classes/alimento.dart';

class SQLHelperAlimentos{
    static Future<sql.Database> db() async {
    return sql.openDatabase(
      'alimentos.db',
      version: 1,
      //onOpen: createTables,
      onCreate: (sql.Database database, int version) async {
        debugPrint('***** Criando tabela *****');
        await createTables(database);
      }
    );
  }

  static Future<List<Map<String, Object?>>> dropDB() async {
    final db = await SQLHelperAlimentos.db();
    return db.rawQuery('DROP DATABASE alimentos.db');
  }

  static Future<void> createTables(sql.Database database) async {
    debugPrint('***** Criando tabela *****');
    await database.execute('''
    CREATE TABLE alimentos(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      ${AlimentosFields.nome} TEXT,
      ${AlimentosFields.fotoBytes} TEXT,
      ${AlimentosFields.categoria} TEXT,
      ${AlimentosFields.tipo} TEXT
    )
''');
  }

  static Future<int> createItem(String nome,String fotoBytes, String categoria, String tipo) async {
    final db = await SQLHelperAlimentos.db();
    final data = {
      AlimentosFields.nome: nome,
      AlimentosFields.fotoBytes: fotoBytes,
      AlimentosFields.categoria: categoria,
      AlimentosFields.tipo: tipo
      };
    final id = await db.insert('alimentos', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  Future<void> deleteDatabase(String path) =>
    databaseFactory.deleteDatabase(path);

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelperAlimentos.db();
    return db.query('alimentos', orderBy: 'id');
  }

  static Future<int> updateItem(Alimento alimentoParaUpdate, int id) async {
    final db = await SQLHelperAlimentos.db();

    final data = alimentoParaUpdate.toJson();

    final result = await db.update('alimentos', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelperAlimentos.db();
    debugPrint('Deletando item com o ID: $id');
    try {
      await db.delete('alimentos',
      where: 'id = ?', whereArgs: [id]
      );
    } catch (err) {
      debugPrint("Algo deu errado ao tentar deletar o item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItemsByName(String name) async {
    final db = await SQLHelperAlimentos.db();
    return db.rawQuery('SELECT * FROM alimentos WHERE nome like "%$name%" ORDER BY id');
  }
}

