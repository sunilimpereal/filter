import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/purifier.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference filterCollection =
      Firestore.instance.collection('Purifiers');
  //collection of service
  final CollectionReference serviceCollection =
      Firestore.instance.collection('Service');

  Future updateUserData(String name, String number, String address) async {
    return await filterCollection
        .document(uid)
        .collection('purifierlist')
        .document()
        .setData({
      'name': name,
      'number': number,
      'address': address,
    });
  }

  //bre list from snapshot
  List<Purifier> _purifierListFromSnapshot(QuerySnapshot snapshot) {
    print('stream called');
    return snapshot.documents.map((doc) {
      return Purifier(
          name: doc.data['name'],
          number: doc.data['number'],
          address: doc.data['address']);
    }).toList();
  }

  //Stream for filters
  Stream<List<Purifier>> get purifierlist {
    print(filterCollection
        .document(uid)
        .collection('purifierlist')
        .snapshots()
        .map(_purifierListFromSnapshot));
    return filterCollection
        .document(uid)
        .collection('purifierlist')
        .snapshots()
        .map(_purifierListFromSnapshot);
  }
}
