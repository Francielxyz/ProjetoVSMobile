import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/injection.dart';
import 'package:http/http.dart' as http;
import 'app/my_app.dart';

void main() async {
  // await buscar();
  print("Teste");
  await setupInjection();
  // Instânciando um novo objeto (MyApp())
  runApp(new MyApp());
}

var linkEndpoint = "http://192.168.54.1:8080/imc";

var apiEndpoint = Uri.parse(linkEndpoint);

Future<List<Imc>> buscar() async {
  var resposta = await http.get(apiEndpoint);

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

salvarOuAtualizar(Imc imc) async {
  var headers = {
    'Content-Type': 'application/json'
  };

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
    var resposta = await http.post(
        apiEndpoint, headers: headers, body: imcJson);
    statusCode = resposta.statusCode;
  } else {
    var resposta = await http.put(apiEndpoint, headers: headers, body: imcJson);
    statusCode = resposta.statusCode;
  }
  if (statusCode != 200) {
    throw Exception("Erro REST API");
  }
}

excluir(int id) async {
  var resposta = await http.delete(Uri.parse(linkEndpoint+"/$id"));

  if (resposta.statusCode != 200) {
    throw Exception("Erros REST API");
  }
}
