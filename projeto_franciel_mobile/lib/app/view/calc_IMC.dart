import 'package:flutter/material.dart';

class CalcIMC extends StatefulWidget{
  @override
  _CalcIMCState createState() => _CalcIMCState();
}

class _CalcIMCState extends State<CalcIMC> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Calcular IMC"),),
    );
  }
}