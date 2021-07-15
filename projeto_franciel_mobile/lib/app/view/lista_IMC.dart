import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/my_app.dart';
import 'package:projeto_franciel_mobile/app/view/lista_imc_back.dart';

class ListarIMC extends StatelessWidget {
  final _back = ListaImcBack();

  CircleAvatar fotoPerfil(String url) {
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget editarImc(Function edit){
    return IconButton(
      icon: Icon(Icons.edit), 
      color: Colors.lightBlueAccent,
      onPressed: edit
      );
  }

  Widget excluirImc(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
      body: Observer(builder: (context) {
        return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Imc> lista = futuro.data;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var imc = lista[i];

                    return ListTile(
                      leading: fotoPerfil(imc.linkFoto),
                      title: Text(imc.nome),
                      subtitle: Text(imc.imc),
                      trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              editarImc((){
                                _back.goToForm(context, imc);
                              }),
                              excluirImc(context, () {
                                _back.excluir(imc.id);
                                Navigator.of(context).pop();
                              }),
                            ],
                          )
                        ));
                  },
                );
              }
            });
      }));
}
