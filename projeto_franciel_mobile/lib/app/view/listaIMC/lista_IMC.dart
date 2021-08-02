import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/view/drawer/drawerIMC.dart';
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      
                      FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: Colors.green,
                        child: Text('Sim'),
                        textColor: Colors.white,
                        onPressed: remove,
                      ),

                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.red,
                        child: Text('Não'),
                        textColor: Colors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: DrawerIMC(),
      appBar: AppBar(
        title: Text('Cálculos Realizados'),
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
                      subtitle: Text("IMC " + imc.imc),
                      trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              editarImc((){
                                _back.goToCalcImc(context, imc);
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
