import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/view/calc_imc_form_back.dart';
import 'package:projeto_franciel_mobile/app/view/calcularIMC/componente/botao_calcular_widget.dart';
import 'package:projeto_franciel_mobile/app/view/calcularIMC/componente/textFormField_widget.dart';
import 'package:projeto_franciel_mobile/app/view/lista_imc_back.dart';

class CalcIMCForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _navegacao = ListaImcBack();

  @override
  Widget build(BuildContext context) {
    var _back = CalcImcFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
        child: Form(
          key: _form,
          child: ListView(
            children: [             

              TextFormFieldWidget(
                labelText: "Nome",
                validator: _back.validarNome,
                initialValue: _back.imc.nome,
                keyboardType: TextInputType.name,
                onSaved: (novoValor) => _back.imc.nome = novoValor,
              ),

              TextFormFieldWidget(
                mask: "#.##",
                labelText: "Altura",
                hintText: "0.00",
                validator: _back.validarAltura,
                initialValue: _back.imc.altura,
                keyboardType: TextInputType.number,
                onSaved: (novoValor) => _back.imc.altura = novoValor,
              ),

              TextFormFieldWidget(
                mask: "##.##",
                labelText: "Peso",
                hintText: "00.00",
                validator: _back.validarPeso,
                initialValue: _back.imc.peso,
                keyboardType: TextInputType.number,
                onSaved: (novoValor) => _back.imc.peso = novoValor,
              ),

              TextFormFieldWidget(
                labelText: "Link Foto",
                hintText: "http://www.site.com",
                initialValue: _back.imc.linkFoto,
                keyboardType: TextInputType.name,
                onSaved: (novoValor) => _back.imc.linkFoto = novoValor,
              ),

              BotaoCalcularWidget(
                labelText: "Calcular",
                onPressed: () {
                   _form.currentState.validate();
                  _form.currentState.save();
                  if (_back.validacao) {
                    _back.salvar();
                    _navegacao.goToListaImc(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
