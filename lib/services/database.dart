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
    String idNumber,
    String id,
    String name,
    String number,
    String area,
    String address,
    String model,
    String membrane,
    String pump,
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
      'idNumber': idNumber,
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'area': area,
      'model': model,
      'membrane': membrane,
      'pump': pump,
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
    String idNumber,
    String id,
    String name,
    String number,
    String address,
    String area,
    String model,
    String membrane,
    String pump,
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
      'idNumber': idNumber,
      'id': id,
      'name': name,
      'number': number,
      'area': area,
      'address': address,
      'model': model,
      'membrane': membrane,
      'pump': pump,
      'price': price,
      'date': date,
      'paid': paid,
      'due': due,
      'img': img,
    });
  }

  Purifier purifierFromSnapshot(DocumentSnapshot snapshot) {
    return Purifier(
      idNumber:
          snapshot.data['idNumber'] == null ? '' : snapshot.data['idNumber'],
      id: snapshot.documentID,
      name: snapshot.data['name'],
      number: snapshot.data['number'],
      address: snapshot.data['address'],
      area: snapshot.data['area'],
      model: snapshot.data['model'],
      membrane: snapshot.data['membrane'],
      pump: snapshot.data['pump'],
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
        idNumber: doc.data['idNumber'],
        id: doc.documentID,
        name: doc.data['name'],
        number: doc.data['number'],
        area: doc.data['area'],
        address: doc.data['address'],
        model: doc.data['model'],
        membrane: doc.data['membrane'],
        pump: doc.data['pump'],
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
    String area,
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
      'area': area,
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
    String area,
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
      'area': area,
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
      area: snapshot.data['area'],
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
        area: doc.data['area'],
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
    String idNumber,
    String id,
    String name,
    String number,
    String area,
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
      'idNumber': idNumber,
      'id': id,
      'name': name,
      'number': number,
      'area': area,
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
    String idNumber,
    String id,
    String name,
    String number,
    String area,
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
      'idNumber': idNumber,
      'id': id,
      'name': name,
      'number': number,
      'area': area,
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
        idNumber: snapshot.data['idNumber'],
        id: snapshot.data['id'],
        name: snapshot.data['name'],
        number: snapshot.data['number'],
        area: snapshot.data['area'],
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
        idNumber: doc.data['idNumber'],
        id: doc.documentID,
        name: doc.data['name'],
        number: doc.data['number'],
        area: doc.data['area'],
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
    String date,
    String description,
    String contact,
    String total,
    String paid,
    String due,
    String item1,
    String q1,
    String price1,
    String item2,
    String q2,
    String price2,
    String item3,
    String q3,
    String price3,
    String item4,
    String q4,
    String price4,
    String item5,
    String q5,
    String price5,
    String item6,
    String q6,
    String price6,
    String item7,
    String q7,
    String price7,
    String item8,
    String q8,
    String price8,
    String item9,
    String q9,
    String price9,
    String item10,
    String q10,
    String price10,
    String item11,
    String q11,
    String price11,
    String item12,
    String q12,
    String price12,
    String item13,
    String q13,
    String price13,
    String item14,
    String q14,
    String price14,
    String item15,
    String q15,
    String price15,
  ) async {
    return await productCollection
        .document(uid)
        .collection('ProductList')
        .document()
        .setData({
      'id': id,
      'date': date,
      'description': description,
      'contact': contact,
      'total': total,
      'paid': paid,
      'due': due,
      'item1': item1,
      'q1': q1,
      'price1': price1,
      'item2': item2,
      'q2': q2,
      'price2': price2,
      'item3': item3,
      'q3': q3,
      'price3': price3,
      'item4': item4,
      'q4': q4,
      'price4': price4,
      'item5': item5,
      'q5': q5,
      'price5': price5,
      'item6': item6,
      'q6': q6,
      'price6': price6,
      'item7': item7,
      'q7': q7,
      'price7': price7,
      'item8': item8,
      'q8': q8,
      'price8': price8,
      'item9': item9,
      'q9': q9,
      'price9': price9,
      'item10': item10,
      'q10': q10,
      'price10': price10,
      'item11': item11,
      'q11': q11,
      'price11': price11,
      'item12': item12,
      'q12': q12,
      'price12': price12,
      'item13': item13,
      'q13': q13,
      'price13': price13,
      'item14': item14,
      'q14': q14,
      'price14': price14,
      'item15': item15,
      'q15': q15,
      'price15': price15,
    });
  }

  Future updateProduct(
    String id,
    String date,
    String description,
    String contact,
    String total,
    String paid,
    String due,
    String item1,
    String q1,
    String price1,
    String item2,
    String q2,
    String price2,
    String item3,
    String q3,
    String price3,
    String item4,
    String q4,
    String price4,
    String item5,
    String q5,
    String price5,
    String item6,
    String q6,
    String price6,
    String item7,
    String q7,
    String price7,
    String item8,
    String q8,
    String price8,
    String item9,
    String q9,
    String price9,
    String item10,
    String q10,
    String price10,
    String item11,
    String q11,
    String price11,
    String item12,
    String q12,
    String price12,
    String item13,
    String q13,
    String price13,
    String item14,
    String q14,
    String price14,
    String item15,
    String q15,
    String price15,
  ) async {
    return await productCollection
        .document(uid)
        .collection('ProductList')
        .document(id)
        .updateData({
      'id': id,
      'date': date,
      'description': description,
      'contact': contact,
      'total': total,
      'paid': paid,
      'due': due,
      'item1': item1,
      'q1': q1,
      'price1': price1,
      'item2': item2,
      'q2': q2,
      'price2': price2,
      'item3': item3,
      'q3': q3,
      'price3': price3,
      'item4': item4,
      'q4': q4,
      'price4': price4,
      'item5': item5,
      'q5': q5,
      'price5': price5,
      'item6': item6,
      'q6': q6,
      'price6': price6,
      'item7': item7,
      'q7': q7,
      'price7': price7,
      'item8': item8,
      'q8': q8,
      'price8': price8,
      'item9': item9,
      'q9': q9,
      'price9': price9,
      'item10': item10,
      'q10': q10,
      'price10': price10,
      'item11': item11,
      'q11': q11,
      'price11': price11,
      'item12': item12,
      'q12': q12,
      'price12': price12,
      'item13': item13,
      'q13': q13,
      'price13': price13,
      'item14': item14,
      'q14': q14,
      'price14': price14,
      'item15': item15,
      'q15': q15,
      'price15': price15,
    });
  }

  deleteProduct(String id) {
    productCollection
        .document(uid)
        .collection('ProductList')
        .document(id)
        .delete();
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product(
        id: doc.documentID,
        date: doc.data['date'],
        description: doc.data['description'],
        contact: doc.data['contact'],
        total: doc.data['total'],
        paid: doc.data['paid'],
        due: doc.data['due'],
        item1: doc.data['item1'],
        q1: doc.data['q1'],
        price1: doc.data['price1'],
        item2: doc.data['item2'],
        q2: doc.data['q2'],
        price2: doc.data['price2'],
        item3: doc.data['item3'],
        q3: doc.data['q3'],
        price3: doc.data['price3'],
        item4: doc.data['item4'],
        q4: doc.data['q4'],
        price4: doc.data['price4'],
        item5: doc.data['item5'],
        q5: doc.data['q5'],
        price5: doc.data['price5'],
        item6: doc.data['item6'],
        q6: doc.data['q6'],
        price6: doc.data['price6'],
        item7: doc.data['item7'],
        q7: doc.data['q7'],
        price7: doc.data['price7'],
        item8: doc.data['item8'],
        q8: doc.data['q8'],
        price8: doc.data['price8'],
        item9: doc.data['item9'],
        q9: doc.data['q9'],
        price9: doc.data['price9'],
        item10: doc.data['item10'],
        q10: doc.data['q10'],
        price10: doc.data['price10'],
        item11: doc.data['item11'],
        q11: doc.data['q11'],
        price11: doc.data['price11'],
        item12: doc.data['item12'],
        q12: doc.data['q12'],
        price12: doc.data['price12'],
        item13: doc.data['item13'],
        q13: doc.data['q13'],
        price13: doc.data['price13'],
        item14: doc.data['item14'],
        q14: doc.data['q14'],
        price14: doc.data['price14'],
        item15: doc.data['item15'],
        q15: doc.data['q15'],
        price15: doc.data['price15'],
      );
    }).toList();
  }

  Stream<List<Product>> get productList {
    print(productCollection
        .document(uid)
        .collection('ProductList')
        .snapshots()
        .map(_productListFromSnapshot));
    return productCollection
        .document(uid)
        .collection('ProductList')
        .snapshots()
        .map(_productListFromSnapshot);
  }
}
