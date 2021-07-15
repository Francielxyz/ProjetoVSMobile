
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';

part 'calc_imc_form_back.g.dart';

class CalcImcFormBack = _CalcImcFormBack with _$CalcImcFormBack;

abstract class _CalcImcFormBack with Store{
  Imc imc;

  //verificar se é alteração ou novo cálculo de imc
  _CalcImcFormBack(BuildContext context){
    var verificacao = ModalRoute.of(context).settings.arguments;
    imc = (verificacao == null) ? Imc(): verificacao;
  }

}