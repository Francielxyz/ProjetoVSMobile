import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_franciel_mobile/app/view/lista_imc_back.dart';

class DrawerIMC extends StatelessWidget {
  final _back = ListaImcBack();

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.green,
        shadowColor: Colors.black,
        child: ListView(
          children: <Widget>[
            configurationHeader(
              nome: "Aplicativo IMC",
            ),
            const Divider(
              height: 5,
              color: Colors.white,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Container(
              padding: padding,
              child: Column(children: [
                configurationMenu(
                  text: 'Calcular Imc',
                  icon: Icons.calculate,
                  onClicked: () => _back.goToCalcImc(context),
                ),
                configurationMenu(
                  text: 'Sobre',
                  icon: Icons.info,
                  onClicked: () => _back.goToSobre(context),
                ),
                configurationMenu(
                  text: 'Sair',
                  icon: Icons.close,
                  onClicked: () => _back.goToFechar(context),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget configurationHeader({String nome}) => InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 15)),
          child: Row(
            children: [
              Container(
                  height: 30,
                  child: Image.network(
                      "https://grnutro.com.br/wp-content/uploads/2016/04/tabela-imc-grnutro-nutrologo-Dr-Guiherme-Moura-curitiba.png")),
              SizedBox(width: 20),
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget configurationMenu({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 18)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
