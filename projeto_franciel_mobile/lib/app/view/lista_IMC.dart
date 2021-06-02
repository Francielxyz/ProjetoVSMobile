import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';

class ListaIMC extends StatefulWidget{
  @override
  _ListaIMCState createState() => _ListaIMCState();
}

class _ListaIMCState extends State<ListaIMC> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC já Calculados'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.CALC_IMC);
            }
          )
        ],
      ),
      body: ListView(),
    );
  }
}