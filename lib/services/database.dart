import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minha_geladeira/models/freezer_item_model.dart';
import 'package:minha_geladeira/models/historico_item_model.dart';

class DatabaseMethods {
  

  Future<bool> addItem({@required String userID, @required FreezerItemModel item}) async {
    QuerySnapshot docs = await getIdItemSeRepetido(nomeItem: item.nome, userID: userID);
    if(docs.docs.length == 0) //significa que nao tem item igual
      FirebaseFirestore.instance.collection("data").doc(userID).collection('itens').doc().set(item.toMap).catchError((e) {
        print(e.toString());
      });
    else {//significa que existe item igual
      item.quantidade += docs.docs[0]['quantidade']; 
      FirebaseFirestore.instance.collection("data").doc(userID).collection('itens').doc(docs.docs[0].id).update(item.toMap).catchError((e) {
        print(e.toString());
      });
    }
    addHistorico(
      item: HistoricoItemModel(
        msg: 'Adicionou', 
        nome: item.nome, 
        quantidade: item.quantidade, 
        data: DateTime.now().millisecondsSinceEpoch, tipo: item.tipo
      ), userID: userID);
  }

  Future<void> addHistorico({@required String userID, @required HistoricoItemModel item}) async {
      FirebaseFirestore.instance.collection("data").doc(userID).collection('historico').doc().set(item.toMap).catchError((e) {
        print(e.toString());
      });
  }

  Future<QuerySnapshot> getIdItemSeRepetido({@required String nomeItem, @required String userID}) async {
    return FirebaseFirestore.instance
        .collection("data").doc(userID).collection('itens')
        .where("nome", isEqualTo: nomeItem)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<List<Map<String, dynamic>> > getTopFive({@required String userID}) async {
    
    List<Map<String, dynamic>> listRes = new List<Map<String, dynamic>>();
    
    await FirebaseFirestore.instance
        .collection("data").doc(userID).collection('historico')
        .where('msg', whereIn: ['Consumiu', 'Utilizou'])
        .get().then((result){

          result.docs.forEach((doc)  {
            //mapResult.update(doc['nome'], (value) => value + doc['quantidade']),
            
            Map<String, dynamic>  mapResult  = new Map<String, dynamic> ();

            mapResult['nome'] = doc['nome'];
            mapResult['quantidade'] = doc['quantidade'];
            mapResult['tipo'] = doc['tipo'];

            bool naoExisteOcorrencia = true;
            if(listRes.length > 0)
              for(int a = 0; a < listRes.length; a++){
                if(listRes[a]['nome'] == mapResult['nome']) {//se a kay ja esistir vai fazer o update  da quantidade
                  listRes[a].update('quantidade', (value) => value + doc['quantidade']);
                  naoExisteOcorrencia = false;
                }
              };
            if(naoExisteOcorrencia)
              listRes.add(mapResult);
            
          });

          if(listRes.length > 0){ //ordenando pelo maior valor
            Comparator<Map<String, dynamic>> pesagemComparator =
              (a, b) => b['quantidade'].compareTo(a['quantidade']);
            listRes.sort(pesagemComparator);
          }
        });
        while(listRes.length > 5) //pegando apenas os 5 maiores
        {
          listRes.removeLast();
        }
    return listRes;
  }

  getItensHistorico({@required String userID}) async{
    return FirebaseFirestore.instance
        .collection("data").doc(userID).collection('historico')
        .snapshots();
  }

  consumirItem({@required int quantidade, @required String userID, @required String itemID}) async{
    if(quantidade == 0) //deleta
      return FirebaseFirestore.instance
          .collection("data").doc(userID).collection('itens')
          .doc(itemID)
          .delete().catchError((e) {
        print(e.toString());
      });
    else
      return FirebaseFirestore.instance
          .collection("data").doc(userID).collection('itens')
          .doc(itemID)
          .update({'quantidade': quantidade}).catchError((e) {
        print(e.toString());
      });
  }

  getItensGaveta({@required String userID}) async{
    return FirebaseFirestore.instance
        .collection("data").doc(userID).collection('itens')
        .where('congelador', isEqualTo: false)
        .snapshots();
  }

  getItensCongelador({@required String userID}) async{
    return FirebaseFirestore.instance
        .collection("data").doc(userID).collection('itens')
        .where('congelador', isEqualTo: true)
        .snapshots();
  }
}
