import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_franciel_mobile/app/view/calc_imc_form_back.dart';

class CalcIMCForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = CalcImcFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: null)],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              campoNome(_back), 
              campoAltura(_back), 
              campoPeso(_back), 
              campoLink(_back)
            ],
          ),
        ),
      ),
    );
  }
}

Widget campoNome(CalcImcFormBack back) {
  return TextFormField(
      initialValue: back.imc.nome,
      decoration: InputDecoration(labelText: "Nome"),
    );
}

Widget campoAltura(CalcImcFormBack back) {
  var maskFormatter = new MaskTextInputFormatter(mask: '#.##');

  return TextFormField(
    initialValue: back.imc.altura,
    inputFormatters: [maskFormatter],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Altura", hintText: "0.00"),
  );
}

Widget campoPeso(CalcImcFormBack back) {
  var maskFormatter = new MaskTextInputFormatter(mask: '##.##');

  return TextFormField(
    initialValue: back.imc.peso,
    inputFormatters: [maskFormatter],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Peso", hintText: "00.00"),
  );
}

Widget campoLink(CalcImcFormBack back) {
  return TextFormField(
      initialValue: back.imc.linkFoto,
      decoration: InputDecoration(
          labelText: 'Endereço Foto:', 
          hintText: 'http://www.site.com'
      ));
}
