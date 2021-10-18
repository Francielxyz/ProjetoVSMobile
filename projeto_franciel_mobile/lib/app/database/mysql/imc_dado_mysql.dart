import 'dart:convert';

import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';
import 'package:http/http.dart' as http;

class ImcDAOMySQL implements ImcDAO {
  final linkEndpoint = Uri.parse("http://192.168.1.7:9191/imc");

  @override
  Future<List<Imc>> find() async {
    var resposta = await http.get(linkEndpoint);

    if (resposta.statusCode != 200) {
      throw Exception("Erro REST API");
    }

    Iterable listDart = json.decode(resposta.body);

    var listImc = <Imc>[];
    for (Map<String, dynamic> imc in listDart) {
      listImc.add(Imc(
        id: imc['id'],
        nome: imc['nome'],
        peso: imc['peso'],
        altura: imc['altura'],
        imc: imc['imc'],
        linkFoto: imc['linkFoto'],
      ));
    }
    return listImc;
  }

  @override
  remove(id) async {
    var uri = Uri.parse("http://192.168.1.7:9191/imc/$id");

    var resposta = await http.delete(uri);

    if (resposta.statusCode != 200) {
      throw Exception("Erro REST API");
    }
  }

  @override
  save(Imc imc) async {
    var headers = {'Content-Type': 'application/json'};

    var imcJson = jsonEncode({
      'id': imc.id,
      'nome': imc.nome,
      'peso': imc.peso,
      'altura': imc.altura,
      'imc': imc.imc,
      'linkFoto': imc.linkFoto,
    });

    int statusCode = 0;
    if (imc.id == 0) {
      var resposta = await http.post(linkEndpoint, headers: headers, body: imcJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta = await http.put(linkEndpoint, headers: headers, body: imcJson);
      statusCode = resposta.statusCode;
    }
    if (statusCode != 200) {
      throw Exception("Erro REST API");
    }
  }
}
