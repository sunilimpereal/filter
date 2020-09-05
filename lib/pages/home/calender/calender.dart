import 'package:flutter/material.dart ';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class CalenderView extends StatefulWidget {
  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime curDate = DateTime.now();
  DateTime _startDate =
      (DateTime.now()).subtract(Duration(days: (DateTime.now().day) - 1));

  DateTime _endDate = (DateTime.now())
      .subtract(Duration(days: (DateTime.now().day) - 1))
      .add(Duration(days: 30));

  Future dispalyDateRangePicker(BuildContext context) async {
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
    return Container();
  }
}

// class Calender extends StatefulWidget {
//   @override
//   _CalenderState createState() => _CalenderState();
// }

// class _CalenderState extends State<Calender> {
//   DateTime _startDate = (new DateTime.now()).subtract(Duration(days:currentDate.day-1)),
//   DateTime _endDate = DateTime.now().add(Duration(days: -7));
//   DateTime currentDate= DateTime.now();

//   Future displayDateRangePicker(BuildContext context) async{
//     final List<DateTime> picked =await DateRangePicker.showDatePicker(
//       context: context,

//       initialFirstDate: new DateTime.now().subtract(Duration(days:currentDate.day-1)),
//       initialLastDate: new( DateTime.now()).add(new Duration(days:30)),
//       firstDate: new DateTime(2015),
//       lastDate: new DateTime(2020)

//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
