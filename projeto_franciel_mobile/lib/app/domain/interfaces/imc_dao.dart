
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';

abstract class ImcDAO{
  
  save(Imc imc);

  remove(int id);

  Future<List<Imc>> find();

}