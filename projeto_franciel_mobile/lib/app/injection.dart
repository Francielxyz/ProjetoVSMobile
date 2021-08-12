import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_franciel_mobile/app/database/firestore/imc_dao_firestore.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';
import 'package:projeto_franciel_mobile/app/domain/service/imcService.dart';

setupInjection() async {
  GetIt getit = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getit.registerSingleton<ImcDAO>(ImcDAOFirestore());
  getit.registerSingleton<ImcService>(ImcService());
}