import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/view/calcularIMC/calc_IMC.dart';
import 'package:projeto_franciel_mobile/app/view/listaIMC/lista_IMC.dart';
import 'package:projeto_franciel_mobile/app/view/sobreApp/sobreApp_page.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CALC_IMC = 'calc_IMC';
  static const SOBRE_APP = 'sobre_app';

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        HOME: (context) =>  ListarIMC(),
        CALC_IMC: (context) =>  CalcIMCForm(),
        SOBRE_APP: (context) => SobreAppPage(),
      },
    );
  }
