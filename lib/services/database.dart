import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/product.dart';
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

  deletePurifier(String id) {
    purifierCollection
        .document(uid)
        .collection('PurifierList')
        .document(id)
        .delete();
  }

  Future updatePurifier(
    String id,
    String name,
    String number,
    String address,
    String model,
    String date,
    String price,
    String paid,
    String due,
    String img,
  ) async {
    return await purifierCollection
        .document(uid)
        .collection('PurifierList')
        .document(id)
        .updateData({
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

  deleteService(String id) {
    serviceCollection
        .document(uid)
        .collection('ServiceList')
        .document(id)
        .delete();
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
        .updateData({
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
    String model,
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
      'model': model,
      'price': price,
      'paid': paid,
      'due': due,
      'expDate': expDate,
    });
  }

  deleteFilter(String id) {
    filterCollection
        .document(uid)
        .collection('FilterList')
        .document(id)
        .delete();
  }

  //Update Filter

  Future updateFilter(
    String id,
    String name,
    String number,
    String address,
    String model,
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
        .updateData({
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'date': date,
      'model': model,
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
        model: snapshot.data['model'],
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
        model: doc.data['model'],
        date: doc.data['date'],
        price: doc.data['price'],
        paid: doc.data['paid'],
        due: doc.data['due'],
        expDate: doc.data['expDate'],
      );
    }).toList();
  }

  Stream<List<Filter>> get filterList {
    print(filterCollection
        .document(uid)
        .collection('FilterList')
        .snapshots()
        .map(_serviceListFromSnapshot));
    return filterCollection
        .document(uid)
        .collection('FilterList')
        .snapshots()
        .map(_filterListFromSnapshot);
  }

//purchase database reference

  final CollectionReference productCollection =
      Firestore.instance.collection('Products');

  Future createProduct(
    String id,
    String item1,
    String price1,
    String item2,
    String price2,
    String item3,
    String price3,
    String item4,
    String price4,
    String item5,
    String price5,
    String item6,
    String price6,
    String item7,
    String price7,
    String item8,
    String price8,
    String item9,
    String price9,
    String item10,
    String price10,
    String item11,
    String price11,
    String item12,
    String price12,
    String item13,
    String price13,
    String item14,
    String price14,
    String item15,
    String price15,
  ) async {
    return await productCollection
        .document(uid)
        .collection('ProductList')
        .document()
        .setData({
      'id': id,
      'item1': item1,
      'price1': price2,
      'item2': item2,
      'price2': price2,
      'item3': item3,
      'price3': price3,
      'item4': item4,
      'price4': price4,
      'item5': item5,
      'price5': price5,
      'item6': item6,
      'price6': price6,
      'item7': item7,
      'price7': price7,
      'item8': item8,
      'price8': price8,
      'item9': item9,
      'price9': price9,
      'item10': item10,
      'price10': price10,
      'item11': item11,
      'price11': price11,
      'item12': item12,
      'price12': price12,
      'item13': item13,
      'price13': price13,
      'item14': item14,
      'price14': price14,
      'item15': item15,
      'price15': price15,
    });
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product(
        id: doc.documentID,
        item1: doc.data['item1'],
        price1: doc.data['price1'],
        item2: doc.data['item2'],
        price2: doc.data['price2'],
        item3: doc.data['item3'],
        price3: doc.data['price3'],
        item4: doc.data['item4'],
        price4: doc.data['price4'],
        item5: doc.data['item5'],
        price5: doc.data['price5'],
        item6: doc.data['item6'],
        price6: doc.data['price6'],
        item7: doc.data['item7'],
        price7: doc.data['price7'],
        item8: doc.data['item8'],
        price8: doc.data['price8'],
        item9: doc.data['item9'],
        price9: doc.data['price9'],
        item10: doc.data['item10'],
        price10: doc.data['price10'],
        item11: doc.data['item11'],
        price11: doc.data['price11'],
        item12: doc.data['item12'],
        price12: doc.data['price12'],
        item13: doc.data['item13'],
        price13: doc.data['price13'],
        item14: doc.data['item14'],
        price14: doc.data['price14'],
        item15: doc.data['item15'],
        price15: doc.data['price15'],
      );
    }).toList();
  }

  Stream<List<Product>> get productList {
    return filterCollection
        .document(uid)
        .collection('ProductList')
        .snapshots()
        .map(_productListFromSnapshot);
  }
}
