
import 'package:flutter/material.dart';
import 'package:projeto_franciel_mobile/app/injection.dart';
import 'app/my_app.dart';

void main() async {
  await setupInjection();
  // Instânciando um novo objeto (MyApp())
  runApp(new MyApp());
}
