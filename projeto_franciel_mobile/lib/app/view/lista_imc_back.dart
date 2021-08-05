import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/service/imcService.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';

part 'lista_imc_back.g.dart';

class ListaImcBack = _ListaImcBack with _$ListaImcBack;

abstract class _ListaImcBack with Store {
  var _serviceImc = GetIt.I.get<ImcService>();

//lista de IMCs
  @observable
  Future<List<Imc>> list;

//método para atualizar a lista
  @action
  refreshList([dynamic value]) {
    list = _serviceImc.find();
  }

  _ListaImcBack() {
    refreshList();
  }

//metodo para chamar a lista de calculos
  goToListaImc(BuildContext context){
      Navigator.of(context)
        .pushNamed(MyApp.HOME)
        .then(refreshList);
  }

//metodo para chamar o cálculo de um novo imc
  goToCalcImc(BuildContext context, [Imc imc]) {
    Navigator.of(context)
        .pushNamed(MyApp.CALC_IMC, arguments: imc)
        .then(refreshList);
  }

//metodo para chamar a tela sobre o applicativo
  goToSobre(BuildContext context) {
    Navigator.of(context).pushNamed(MyApp.SOBRE_APP);
  }

//metodo para sair do aplicativo, trazendo uma msg para confirma ou não
  goToFechar(BuildContext context) {
    Widget cancel = FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.red,
        child: Text("Não"),
        textColor: Colors.white,
        onPressed: () => Navigator.of(context).pop());

    Widget confirm = FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.green,
        child: Text("Sim"),
        textColor: Colors.white,
        onPressed: () => SystemNavigator.pop());

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text("Deseja fechar o aplicativo?"),
      actions: [
        confirm,
        cancel,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//método de ecluiir
  excluir(int id) {
    _serviceImc.remove(id);
    refreshList();
  }
}
