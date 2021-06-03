import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';

class ListarIMC extends StatelessWidget {
  final lista = [
    {'nome': 'Franciel', 'kg': '75', 'altura': '1,80', 'IMC': '23,65'},
    {'nome': 'Carlos', 'kg': '85', 'altura': '1,70', 'IMC': '29,41'},
    {'nome': 'Hinata', 'kg': '50', 'altura': '1,50', 'IMC': '22,22'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC já Calculados'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.CALC_IMC);
              })
        ],
        ),
          body: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, i){
              var imc = lista[i];
              return ListTile(
                title: Text(imc['nome']),
                subtitle: Text(imc['kg']),
                
                trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: null),
                    IconButton(icon: Icon(Icons.delete), onPressed: null),
                  ],
                )
                ),
              );
            },
          )
    );
  }
}


