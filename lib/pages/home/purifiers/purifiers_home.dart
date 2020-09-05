import 'package:filter/pages/home/purifiers/purifier_form.dart';
import 'package:filter/pages/home/purifiers/purifiertile.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class PurifierHome extends StatefulWidget {
  @override
  _PurifierHomeState createState() => _PurifierHomeState();
}

class _PurifierHomeState extends State<PurifierHome> {
  DateTime curDate = DateTime.now();
  DateTime _startDate =
      (DateTime.now()).subtract(Duration(days: ((DateTime.now().day) - 1)));

  DateTime _endDate = (DateTime.now())
      .subtract(Duration(days: (DateTime.now().day) - 1))
      .add(Duration(days: 29));

  Future dispalyDateRangePicker(BuildContext context) async {
    print(_startDate);
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: new DateTime(DateTime.now().year - 20),
      lastDate: new DateTime(DateTime.now().year + 20),
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Purifier>>.value(
      value: DatabaseService(uid: user.uid).purifierList,
      child: Scaffold(
        backgroundColor: Color(0xFFe5e5e5),
        appBar: GradientAppBar(
          elevation: 0.0,
          backgroundColorStart: Color(0xFF153243),
          backgroundColorEnd: Color(0xFF153243),
          title: Text('Installation'),
          actions: [
            IconButton(
              icon: Icon(Icons.insert_invitation),
              iconSize: 30.0,
              onPressed: () {
                dispalyDateRangePicker(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurifierForm()));
              },
            )
          ],
        ),
        body: PurifierList(
          startDate: _startDate,
          endDate: _endDate,
        ),
      ),
    );
  }

//   Widget purifierlist(
//       BuildContext context, DateTime startDate, DateTime endDate) {
//     print('Date');
//     print(startDate);
//     final purifiers = Provider.of<List<Purifier>>(context) ?? [];
//     purifiers.sort((a, b) => b.date.compareTo(a.date));
//     List<Purifier> newPurifiers = [];
//     for (var i = 0; i < purifiers.length; i++) {
//       DateTime ndate = DateTime.parse(purifiers[i].date);
//       if (ndate.isAfter(startDate) && ndate.isBefore(endDate)) {
//         newPurifiers.add(purifiers[i]);
//       }
//     }

//     print(purifiers);
//     return ListView.builder(
//       itemCount: newPurifiers.length,
//       itemBuilder: (context, index) {
//         return PurifierTile(purifier: newPurifiers[index]);
//       },
//     );
//   }
// }
}

class PurifierList extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  PurifierList({this.startDate, this.endDate});
  @override
  _PurifierListState createState() => _PurifierListState();
}

class _PurifierListState extends State<PurifierList> {
  @override
  Widget build(BuildContext context) {
    final purifiers = Provider.of<List<Purifier>>(context) ?? [];
    purifiers.sort((a, b) => b.date.compareTo(a.date));
    List<Purifier> newPurifiers = [];
    for (var i = 0; i < purifiers.length; i++) {
      DateTime ndate = DateTime.parse(purifiers[i].date);
      if (ndate.isAfter(widget.startDate) && ndate.isBefore(widget.endDate)) {
        newPurifiers.add(purifiers[i]);
      }
    }

    print(purifiers);
    return ListView.builder(
      itemCount: newPurifiers.length,
      itemBuilder: (context, index) {
        return PurifierTile(purifier: newPurifiers[index]);
      },
    );
  }
}

// class PurifierList extends StatelessWidget {
//   final DateTime startDate;
//   final DateTime endDate;
//   PurifierList({this.startDate, this.endDate});

//   @override
//   Widget build(BuildContext context) {
//     print('Date');
//     print(startDate);
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
