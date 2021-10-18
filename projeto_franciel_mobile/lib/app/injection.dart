import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_franciel_mobile/app/database/mysql/imc_dado_mysql.dart';
import 'package:projeto_franciel_mobile/app/database/sqlite/dao/imc_dao_imple.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';
import 'package:projeto_franciel_mobile/app/domain/service/imcService.dart';

setupInjection() async {
  GetIt getit = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();

  getit.registerSingleton<ImcDAO>(ImcDAOMySQL());
  getit.registerSingleton<ImcService>(ImcService());
}