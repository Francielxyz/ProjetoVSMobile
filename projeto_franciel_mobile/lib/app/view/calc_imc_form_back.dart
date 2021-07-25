import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/service/imcService.dart';


class CalcImcFormBack {
  Imc imc;
  var _serviceIMC = GetIt.I.get<ImcService>();
  bool _nomeValido;
  bool _alturaValido;
  bool _pesoValido;

  // bool _imcvalido;  
  
  bool get validacao => _nomeValido && _alturaValido && _pesoValido ;

  //verificar se é alteração ou novo cálculo de imc
  CalcImcFormBack(BuildContext context) {
    var verificacao = ModalRoute.of(context).settings.arguments;
    imc = (verificacao == null) ? Imc() : verificacao;
  }

  //salvar
  salvar() async {
    await _serviceIMC.save(imc);
  }

  //validações
  String validarNome(String nome) {
    try {
      _serviceIMC.validarNome(nome);

      _nomeValido = true;
      return null;
    } catch (e) {
      _nomeValido = false;
      return e.toString();
    }
  }

  String validarAltura(String altura) {
    try {
      _serviceIMC.validarAltura(altura);
      _alturaValido = true;
      return null;
    } catch (e) {
      _alturaValido = false;
      return e.toString();
    }
  }

  String validarPeso(String peso) {
    try {
      _serviceIMC.validarPeso(peso);
      _pesoValido = true;
      return null;
    } catch (e) {
      _pesoValido = false;
      return e.toString();
    }
  }

  // String validarIMC(String altura, String peso) {
  //   try {
  //     _serviceIMC.calcDoImc(altura, peso);
  //     _imcvalido = true;
  //     return null;
  //   } catch (e) {
  //     _imcvalido = false;
  //     return e.toString();
  //   }
  // }

}
