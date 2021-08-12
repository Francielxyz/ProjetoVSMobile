import 'package:get_it/get_it.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/exception/domainException.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';

class ImcService {
  var _dao = GetIt.I.get<ImcDAO>();

  save(Imc imc){
    validarNome(imc.nome);
    validarPeso(imc.peso);
    validarAltura(imc.altura);
    imc.imc = calcDoImc(imc.altura, imc.peso);
    _dao.save(imc);
  }

  remove(dynamic id){
    _dao.remove(id);
  }

  Future<List<Imc>> find(){
    return _dao.find();
  }

  
//Nome - Obrigatório, Min 3 caracteres e máximo(60)
  validarNome(String nome) {
    var menor = 3;
    var maior = 60;

    if (nome == null) {
      throw new DomainException("Nome Obrigatório");
    } else if (nome.length < menor) {
      throw new DomainException(
          "Nome deve possir pelo menos $menor caracteres");
    } else if (nome.length > maior) {
      throw new DomainException("Nome deve possuir no máximo $maior caracteres");
    }
  }

//Peso - Obrigatório
  validarPeso(String peso) {
    if (peso == null) {
      throw new DomainException("Peso deve ser Obrigatório");
    }
  }

//Altura - Obrigatório
  validarAltura(String altura) {
    if (altura == null) {
      throw new DomainException("Altura deve ser Obrigatório");
    }
  }

//Calculo do IMC
  String calcDoImc(String altura, String peso){
    double valorImc = double.parse(peso) / (double.parse(altura) * double.parse(altura));
    return valorImc.toStringAsPrecision(4);    
  }

} 
