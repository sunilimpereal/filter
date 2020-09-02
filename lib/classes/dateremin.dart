class DateReminder {
  final String date;
  DateReminder({this.date});
  String addthreeMonths() {
    DateTime ndate = DateTime.parse(date ?? '');
    DateTime nnDate = new DateTime(
      ndate.year,
      ndate.month + 3,
      ndate.day,
      ndate.hour,
      ndate.minute,
      ndate.second,
      ndate.millisecond,
      ndate.microsecond,
    );
    // String newDate = DateFormat.yMMMMd().format(nnDate);
    return nnDate.toString();
  }
}
