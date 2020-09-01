import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/purifier.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference purifierCollection =
      Firestore.instance.collection('Purifiers');

  // Collection of service

  final CollectionReference serviceCollection =
      Firestore.instance.collection('Services');

  Future createPurifer(
    String id,
    String name,
    String number,
    String address,
    String model,
    String price,
    String date,
    String paid,
    String due,
    String img,
  ) async {
    return await purifierCollection
        .document(uid)
        .collection('PurifierList')
        .document()
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'model': model,
      'price': price,
      'date': date,
      'paid': paid,
      'due': due,
      'img': img,
    });
  }

  Future updatePurifer(
    String id,
    String name,
    String number,
    String address,
    String model,
    String price,
    String date,
    String paid,
    String due,
    String img,
  ) async {
    return await purifierCollection
        .document(uid)
        .collection('PurifierList')
        .document(id)
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'model': model,
      'price': price,
      'date': date,
      'paid': paid,
      'due': due,
      'img': img,
    });
  }

  Purifier purifierFromSnapshot(DocumentSnapshot snapshot) {
    return Purifier(
      id: snapshot.documentID,
      name: snapshot.data['name'],
      number: snapshot.data['number'],
      address: snapshot.data['address'],
      model: snapshot.data['model'],
      price: snapshot.data['price'],
      date: snapshot.data['date'],
      paid: snapshot.data['paid'],
      due: snapshot.data['due'],
      img: snapshot.data['img'],
    );
  }

  //bre list from snapshot
  List<Purifier> _purifierListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Purifier(
        id: doc.documentID,
        name: doc.data['name'],
        number: doc.data['number'],
        address: doc.data['address'],
        model: doc.data['model'],
        price: doc.data['price'],
        date: doc.data['date'],
        paid: doc.data['paid'],
        due: doc.data['due'],
        img: doc.data['img'],
      );
    }).toList();
  }

  //Stream for filters
  Stream<List<Purifier>> get purifierList {
    return purifierCollection
        .document(uid)
        .collection('PurifierList')
        .snapshots()
        .map(_purifierListFromSnapshot);
  }
}
