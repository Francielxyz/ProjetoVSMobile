import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/database/sqlite/conection.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';
import 'package:sqflite/sqflite.dart';

class ListarIMC extends StatelessWidget {

  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await Conection.get();
    return db.query('tb_imc');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista = futuro.data;
          return 
           Scaffold(
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
                  itemBuilder: (context, i) {
                    var imc = lista[i];
                    var fotoPerfil = CircleAvatar( backgroundImage: NetworkImage(imc['link_foto']),);
                    return ListTile(
                      leading: fotoPerfil,
                      title: Text(imc['nome']),
                      subtitle: Text(imc['imc']),
                      
                      trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit), onPressed: null),
                              IconButton(
                                  icon: Icon(Icons.delete), onPressed: null),
                            ],
                          )),
                    );
                  },
                ));
        }else{
          return Scaffold();
        }
      }
      );
  }
}