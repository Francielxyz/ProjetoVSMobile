import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/database/sqlite/dao/imc_dao_imple.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';

class ListarIMC extends StatelessWidget {
  Future<List<Imc>> _buscar() async {
    return ImcDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Imc> lista = futuro.data;
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
                  itemBuilder: (context, i) {
                    var imc = lista[i];
                    var fotoPerfil = CircleAvatar(
                      backgroundImage: NetworkImage(imc.linkFoto),
                    );
                    return ListTile(
                      leading: fotoPerfil,
                      title: Text(imc.nome),
                      subtitle: Text(imc.imc),
                      trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.delete), onPressed: null),
                            ],
                          )),
                    );
                  },
                ));
          } else {
            return Scaffold();
          }
        });
  }
}
