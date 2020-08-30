import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/purifier.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference filterCollection =
      Firestore.instance.collection('Purifiers');

  Future createPurifer(
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
    return await filterCollection
        .document(uid)
        .collection('PurifierList')
        .document()
        .setData({
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

  //bre list from snapshot
  List<Purifier> _purifierListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Purifier(
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
    return filterCollection
        .document(uid)
        .collection('PurifierList')
        .snapshots()
        .map(_purifierListFromSnapshot);
  }
}
