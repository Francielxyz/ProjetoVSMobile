import 'package:projeto_franciel_mobile/app/database/sqlite/conection.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imc_dao.dart';
import 'package:sqflite/sqflite.dart';

class ImcDAOImpl implements ImcDAO{
  Database _db;

  @override
  Future<List<Imc>> find() async {
    _db = await Conection.get();
    List<Map<String, dynamic>> resultado = await _db.query("tb_imc");
    List<Imc> lista = List.generate(resultado.length, (i){
      
      var linha = resultado[i];
      return Imc(
          id : linha["id"],
          nome : linha["nome"],
          peso : linha["peso"],
          altura : linha["altura"],
          imc : linha["imc"],
          linkFoto: linha["linkFoto"]);
    });
    
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Conection.get();
    var sql = "DELETE FROM imc WHERE id = ?";
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Imc imc) async {
    _db = await Conection.get();
    var sql;
    
    if (imc.id == null) {
      sql = "INSERT INTO tb_imc (nome, peso, altura, imc, linkFoto) VALUES (?, ?, ?, ?, ?)";
      _db.rawInsert(sql, [imc.nome, imc.peso, imc.altura, imc.imc, imc.linkFoto]);
    } else {
      sql = "UPDATE tb_imc SET nome = ?, peso = ?, altura = ?, imc = ?, linkFoto = ? WHERE id = ?";
      _db.rawUpdate(sql, [imc.nome, imc.peso, imc.altura, imc.imc, imc.linkFoto, imc.id]);
    }
  }
}