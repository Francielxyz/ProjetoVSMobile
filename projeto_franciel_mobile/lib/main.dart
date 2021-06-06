import 'package:flutter/material.dart';

import 'app/my_app.dart';

/*
void main() {
  // Instânciando um novo objeto (MyApp())
  runApp(new MyApp());
}*/
void main(List<String> arguments) async {
  
  
  print("Iniciando Verificação");
  await irMontanhaRussa('Franciel', 1.80, 11);
  print("Fim Verificação");
    
  print("\nCalculando seu IMC");
  var altura = 1.90;
  var peso = 93.85;
  await imc(peso, altura);
  print("Fim Calculo");
    

  print("\nNotas");
  await turmaNotas();
}


Future irMontanhaRussa(String nome, double altura, int idade) {
  if (altura >= 1.60 && idade >= 18) {
    return Future.delayed(Duration(seconds: 2), () => print('Acesso Liberado a Montanha Russa'));
  }
  if (altura >= 1.60 && idade < 18) {
    return Future.delayed(Duration(seconds: 2), () => print('Acesso Negado, Você é Menor de Idade'));
  }
  if (altura < 1.60 && idade >= 18) {
    return Future.delayed(Duration(seconds: 2), () => print('Acesso Negado, Tamanho mínimo não atingido'));
  } else {
    return Future.delayed(Duration(seconds: 2), () => print('Acesso Negado, Tamanho mínimo não atingido e menor de idade'));
  }
}

Future imc(double peso, double altura) {
  var taxa = peso / (altura * altura);

  if (taxa < 18.5) {
    return Future.delayed(Duration(seconds: 2), () => print("Índice de Magreza"));
  }
  if (taxa >= 18.5 && taxa <= 24.9) {
    return Future.delayed(Duration(seconds: 1), () => print("Índice Normal"));
  }
  if (taxa >= 25.0 && taxa <= 29.9) {
    return Future.delayed(Duration(seconds: 1), () => print("Índice de SobrePeso I"));
  }
  if (taxa >= 30.0 && taxa <= 39.9) {
    return Future.delayed(Duration(seconds: 1), () => print("Índice de SobrePeso II"));
  }
  else{
    return Future.delayed(Duration(seconds: 1), () => print("Índice de Obesidade Grave"));
  }
}


Future turmaNotas() async {
  var notas = <double>[10, 3, 6, 8];
  var qtd = notas.length;
  var soma = 0.0;

  for (var x = 0; x < qtd; x++) {
     print("Nota ${1 + x} = ${notas[x]} ");
    soma += notas[x];
  }
    
  var media = soma / qtd;
  print("Calculando Aprovação");
  var msg = (media >= 6.0)
      ? Future.delayed(Duration(seconds: 2), () => print("Notal Final $soma - Média $media = APROVADO"))
      : Future.delayed(Duration(seconds: 2), () => print("Notal Final $soma - Média $media = REPROVADO"));
}



