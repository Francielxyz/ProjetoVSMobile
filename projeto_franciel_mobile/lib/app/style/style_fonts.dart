import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesFonts {

  //utilizado no menu "sobre" para cada título
  static TextStyle tituloSobre(context) {
    return GoogleFonts.notoSans(
      color: Colors.green.shade900,
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontWeight: FontWeight.bold
    );
  }

  //utilizado no menu "sobre" para cada subtítulo
  static TextStyle subTitulosSobre(context) {
    return GoogleFonts.notoSans(
      color: Colors.green,
      fontSize: MediaQuery.of(context).size.width * 0.03,
      fontWeight: FontWeight.bold,
    );
  }

  //utilizado no menu "sobre" para os títulos das opções clicaveis (suporte e telefone)
  static TextStyle titulosSobreLinks(context) {
    return GoogleFonts.notoSans(
        color: Colors.green.shade900,
      decoration: TextDecoration.underline,
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontWeight: FontWeight.bold,
    );
  }
}