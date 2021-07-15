import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/view/calc_IMC.dart';
import 'package:projeto_franciel_mobile/app/view/lista_IMC.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CALC_IMC = 'calc_IMC';

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
      },
    );
  }
