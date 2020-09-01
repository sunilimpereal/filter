// import 'package:filter/models/purifier.dart';
// import 'package:flutter/material.dart';
// import 'package:filter/classes/format_date.dart';
// import 'package:intl/intl.dart';

// class PurifierTile extends StatefulWidget {
//   final Purifier purifier;
//   PurifierTile({this.purifier});

//   @override
//   _PurifierTileState createState() => _PurifierTileState();
// }

// class _PurifierTileState extends State<PurifierTile> {
//   @override
//   build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
//         child: Stack(
//           children: [
//             filterCard(widget.date, widget.name, widget.model, widget.number,
//                 widget.id),
//             filterThumbnail,
//           ],
//         ),
//       ),
//     );
//   }

//   final filterThumbnail = new Container(
//     height: 100,
//     width: 90,
//     margin: new EdgeInsets.symmetric(vertical: 16.0),
//     decoration: new BoxDecoration(
//       color: const Color(0xFF333366),
//       image: new DecorationImage(
//         image: new AssetImage('lib/assets/img/purifier.png'),
//         fit: BoxFit.cover,
//       ),
//       borderRadius: new BorderRadius.all(new Radius.circular(55.0)),
//       border: new Border.all(
//         color: Color(0xFF333366),
//         width: 3.0,
//       ),
//     ),
//   );

//   filterCard(String date, String name, String model, String number, String id) {
//     return Container(
//       height: 124.0,
//       width: double.infinity,
//       margin: new EdgeInsets.only(left: 40.0),
//       decoration: new BoxDecoration(
//           color: new Color(0xFF333366),
//           shape: BoxShape.rectangle,
//           borderRadius: new BorderRadius.circular(8.0),
//           boxShadow: <BoxShadow>[
//             new BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10.0,
//                 offset: new Offset(0.0, 10.0))
//           ]),
//       child: Container(
//         padding: EdgeInsets.only(left: 46.0),
//         child: Row(
//           children: [
//             Container(
//               width: 240,
//               height: 100,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white),
//                         ),
//                         Text(
//                           date ?? '',
//                           style: TextStyle(
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           'New Installation | $number',
//                           style: TextStyle(
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
