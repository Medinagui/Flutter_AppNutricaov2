import 'dart:io';
import 'package:sqflite/sqflite.dart';
import '../components/classes/alimento.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


// ignore: constant_identifier_names
const String DATABASE_NAME = "alimentos.db";

class AlimentosDatabase {
  static final AlimentosDatabase instance = AlimentosDatabase._init();

  static Database? _database;

  AlimentosDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(DATABASE_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT';

    await db.execute(
      '''
CREATE TABLE $tableAlimentos (
  ${AlimentosFields.id} $idType,
  ${AlimentosFields.nome} $textType,
  ${AlimentosFields.fotoBytes} $textType,
  ${AlimentosFields.categoria} $textType,
  ${AlimentosFields.tipo} $textType)
''');
  }

  // temp init

  Future dropDB() async {
    final db = await instance.database;
    db.rawQuery("DROP DATABASE $DATABASE_NAME");
  }

  Future<void> dropTableIfExistsThenReCreate() async {
    Database db = await _initDB(DATABASE_NAME);
    await db.execute("DROP TABLE IF EXISTS $tableAlimentos");
    await _createDB(db, 1);
  }

  // temp final

  Future<Alimento> create(Alimento alimento) async {
    await _initDB(DATABASE_NAME);
    final db = await instance.database;
    final id = await db.insert(tableAlimentos, alimento.toJson());
    print('CADASTRADO!');
    return alimento.copy(id: id);
  }

  Future<Alimento> readAlimento(int id) async {
    //await dropTableIfExistsThenReCreate();
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

  Future<List<dynamic>> readAllAlimentos() async {
    await dropTableIfExistsThenReCreate();
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
