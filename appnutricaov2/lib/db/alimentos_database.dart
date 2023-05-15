import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import '../components/classes/alimento.dart';

class SQLHelperAlimentos{
    static Future<sql.Database> db() async {
    return sql.openDatabase(
      'alimentos.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        debugPrint('***** Criando tabela *****');
        await createTables(database);
      }
    );
  }

  static Future<void> createTables(sql.Database database) async {
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
    try {
      await db.delete('alimentos',
      where: 'id = ?', whereArgs: [id]
      );
    } catch (err) {
      debugPrint("Algo deu errado ao tentar deletar o item: $err");
    }
  }
}