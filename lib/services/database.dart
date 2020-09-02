import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference purifierCollection =
      Firestore.instance.collection('Purifiers');

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

  //Stream for Purifier
  Stream<List<Purifier>> get purifierList {
    print(purifierCollection
        .document(uid)
        .collection('PurifierList')
        .snapshots()
        .map(_purifierListFromSnapshot));
    return purifierCollection
        .document(uid)
        .collection('PurifierList')
        .snapshots()
        .map(_purifierListFromSnapshot);
  }

  // Database for service
  // Collection of service

  final CollectionReference serviceCollection =
      Firestore.instance.collection('Services');

  Future createService(
    String id,
    String name,
    String number,
    String address,
    String description,
    String date,
    String spare1,
    String spare2,
    String spare3,
    String sparePrice1,
    String sparePrice2,
    String sparePrice3,
    String price,
    String paid,
    String due,
  ) async {
    return await serviceCollection
        .document(uid)
        .collection('ServiceList')
        .document()
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'description': description,
      'date': date,
      'spare1': spare1,
      'spare2': spare2,
      'spare3': spare3,
      'sparePrice1': sparePrice1,
      'sparePrice2': sparePrice2,
      'sparePrice3': sparePrice3,
      'price': price,
      'paid': paid,
      'due': due,
    });
  }

  Future updateService(
    String id,
    String name,
    String number,
    String address,
    String description,
    String date,
    String spare1,
    String spare2,
    String spare3,
    String sparePrice1,
    String sparePrice2,
    String sparePrice3,
    String price,
    String paid,
    String due,
  ) async {
    return await serviceCollection
        .document(uid)
        .collection('ServiceList')
        .document(id)
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'date': date,
      'description': description,
      'spare1': spare1,
      'spare2': spare2,
      'spare3': spare3,
      'sparePrice1': sparePrice1,
      'sparePrice2': sparePrice2,
      'sparePrice3': sparePrice3,
      'price': price,
      'paid': paid,
      'due': due,
    });
  }

  Service serviceFromSnapshot(DocumentSnapshot snapshot) {
    return Service(
      id: snapshot.data['id'],
      name: snapshot.data['name'],
      number: snapshot.data['number'],
      address: snapshot.data['address'],
      date: snapshot.data['date'],
      description: snapshot.data['description'],
      spare1: snapshot.data['spare1'],
      spare2: snapshot.data['spare2'],
      spare3: snapshot.data['spare3'],
      sparePrice1: snapshot.data['sparePrice1'],
      sparePrice2: snapshot.data['sparePrice2'],
      sparePrice3: snapshot.data['sparePrice3'],
      price: snapshot.data['price'],
      paid: snapshot.data['paid'],
      due: snapshot.data['due'],
    );
  }

  List<Service> _serviceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Service(
        id: doc.documentID,
        name: doc.data['name'],
        number: doc.data['number'],
        address: doc.data['address'],
        date: doc.data['date'],
        description: doc.data['description'],
        spare1: doc.data['spare1'],
        spare2: doc.data['spare2'],
        spare3: doc.data['spare3'],
        sparePrice1: doc.data['sparePrice1'],
        sparePrice2: doc.data['sparePrice2'],
        sparePrice3: doc.data['sparePrice3'],
        price: doc.data['price'],
        paid: doc.data['paid'],
        due: doc.data['due'],
      );
    }).toList();
  }

  //Stream for list of Service
  Stream<List<Service>> get serviceList {
    print(serviceCollection
        .document(uid)
        .collection('ServiceList')
        .snapshots()
        .map(_serviceListFromSnapshot));
    return serviceCollection
        .document(uid)
        .collection('ServiceList')
        .snapshots()
        .map(_serviceListFromSnapshot);
  }

  // filter database

  final CollectionReference filterCollection =
      Firestore.instance.collection('Filters');

  //Create filter

  Future createFilter(
    String id,
    String name,
    String number,
    String address,
    String date,
    String price,
    String paid,
    String due,
    String expDate,
  ) async {
    return await filterCollection
        .document(uid)
        .collection('FilterList')
        .document()
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'date': date,
      'price': price,
      'paid': paid,
      'due': due,
      'expDate': expDate,
    });
  }

  //Update Filter

  Future updateFilter(
    String id,
    String name,
    String number,
    String address,
    String date,
    String price,
    String paid,
    String due,
    String expDate,
  ) async {
    return await filterCollection
        .document(uid)
        .collection('FilterList')
        .document(id)
        .setData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'date': date,
      'price': price,
      'paid': paid,
      'due': due,
      'expDate': expDate,
    });
  }

  //filter from document
  Filter filterFromSnapshot(DocumentSnapshot snapshot) {
    return Filter(
        id: snapshot.data['id'],
        name: snapshot.data['name'],
        number: snapshot.data['number'],
        address: snapshot.data['address'],
        date: snapshot.data['date'],
        price: snapshot.data['price'],
        paid: snapshot.data['paid'],
        due: snapshot.data['due'],
        expDate: snapshot.data['expDate']);
  }

  //stream for filters
  List<Filter> _filterListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Filter(
        id: doc.documentID,
        name: doc.data['name'],
        number: doc.data['number'],
        address: doc.data['address'],
        date: doc.data['date'],
        price: doc.data['price'],
        paid: doc.data['paid'],
        due: doc.data['due'],
        expDate: doc.data['expDate'],
      );
    }).toList();
  }

  Stream<List<Filter>> get filterList {
    print(serviceCollection
        .document(uid)
        .collection('FilterLIst')
        .snapshots()
        .map(_serviceListFromSnapshot));
    return serviceCollection
        .document(uid)
        .collection('ServiceList')
        .snapshots()
        .map(_filterListFromSnapshot);
  }
}
