import 'package:path/path.dart';
import 'package:projeto_franciel_mobile/app/database/sqlite/banco.dart';
import 'package:sqflite/sqflite.dart';

class Conection{
  static Database _db;

  static Future<Database> get() async {
    if(_db == null){
      var path = join(await getDatabasesPath(), 'tb_imc');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v){
          db.execute(createTable);
          db.execute(insertInto1);
          db.execute(insertInto2);
          db.execute(insertInto3);
          db.execute(insertInto4);
        }
        );
    }
    return _db;
  }

}