import 'package:flutter/cupertino.dart';
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

//metodo para chamar o cálculo de um novo imc
  goToForm(BuildContext context, [Imc imc]) {
    Navigator.of(context).pushNamed(MyApp.CALC_IMC, arguments: imc).then(refreshList);
  }

//método de ecluiir
  excluir(int id) {
    _serviceImc.remove(id);
    refreshList();
  }
}
