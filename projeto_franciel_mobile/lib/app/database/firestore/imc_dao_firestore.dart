
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_franciel_mobile/app/domain/entities/imc.dart';
import 'package:projeto_franciel_mobile/app/domain/interfaces/imcDao.dart';

class ImcDAOFirestore implements ImcDAO {
  CollectionReference imcCollection;

  ImcDAOFirestore(){
    imcCollection = FirebaseFirestore.instance.collection('imc');
  }

  @override
  Future<List<Imc>> find() async {
    var resultado = await imcCollection.get();
    return resultado.docs.map(
      (doc) => Imc(
        id:doc.reference.id.toString(),
        nome:doc['nome'],
        peso:doc['peso'],
        altura:doc['altura'],
        imc:doc['imc'],
        linkFoto:doc['linkFoto']
      )
    ).toList();
  }

  @override
  remove(id) {
    imcCollection.doc(id).delete();
  }

  @override
  save(Imc imc) {
    imcCollection.doc(imc.id).set({
      'nome': imc.nome,
      'peso': imc.peso,
      'altura': imc.altura,
      'imc': imc.imc,
      'linkFoto': imc.linkFoto
    });
  }

}