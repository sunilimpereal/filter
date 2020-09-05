// import 'package:filter/pages/home/purifiers/purifiertile.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:filter/models/purifier.dart';

// class PurifierList extends StatefulWidget {
//   @override
//   _PurifierListState createState() => _PurifierListState();
// }

// class _PurifierListState extends State<PurifierList> {
//   @override
//   Widget build(BuildContext context) {
//     final purifiers = Provider.of<List<Purifier>>(context) ?? [];
//     purifiers.sort((a, b) => b.date.compareTo(a.date));

//     print(purifiers);
//     return ListView.builder(
//       itemCount: purifiers.length,
//       itemBuilder: (context, index) {
//         return PurifierTile(purifier: purifiers[index]);
//       },
//     );
//   }
// }
