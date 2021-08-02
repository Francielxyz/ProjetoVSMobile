import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:projeto_franciel_mobile/app/style/style_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreApp extends StatelessWidget {
  
Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não pode abrir o link $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Center(
        // child: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: PackageInfo.fromPlatform(),
                  builder: (BuildContext context,
                      AsyncSnapshot<PackageInfo> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text("\n\n\nVersão do App", style: StylesFonts.tituloSobre(context)),
                          Text(snapshot.data.version, style: StylesFonts.subTitulosSobre(context)),

                          Text("\nVersão do Banco de Dados App",style: StylesFonts.tituloSobre(context)),
                          Text(snapshot.data.buildNumber, style: StylesFonts.subTitulosSobre(context)),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.copy_rounded, color: Colors.green.shade900),
                  label: Text("Acesse o Repositório Open Source", style: StylesFonts.titulosSobreLinks(context)),
                  onPressed: () => _launchLink('https://github.com/Francielxyz/ProjetoVSMobile'),
                ),

                TextButton.icon(
                  icon: Icon(Icons.emoji_emotions, color: Colors.green.shade900),
                  label: Text("Todos Direitos Reservados",style: StylesFonts.titulosSobreLinks(context)),
                  onPressed: () => _launchLink('https://www.instagram.com/franciel_ruam/'),
                ),

                TextButton.icon(
                  icon: Icon(Icons.email, color: Colors.green.shade900),
                  label: Text('Entre em Contato', style: StylesFonts.titulosSobreLinks(context)),
                  onPressed: () => _launchLink('mailto:ruanvha15@gmail.com'),
                ),
              ],
            ),
          ),
        ]),
      ),
      
    );
  }
}
