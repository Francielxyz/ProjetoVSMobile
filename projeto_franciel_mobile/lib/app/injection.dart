import 'package:get_it/get_it.dart';
import 'package:projeto_franciel_mobile/app/database/sqlite/dao/imc_dao_imple.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<ImcDAO>(ImcDAOImpl());
}