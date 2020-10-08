import 'package:intl/intl.dart';
import 'package:sms_maintained/sms.dart';

void sendSms(String numb, String date, String date1) {
  SmsSender sender = new SmsSender();
  String pdate = DateFormat('dd/MM/yyy').format(DateTime.parse(date ?? ''));
  String pdate1 = DateFormat('dd/MM/yyy').format(DateTime.parse(date1 ?? ''));
  sender.sendSms(new SmsMessage(numb,
      "\nBK WATER SOLUTION \nFILTER SERCIVE REMINDER\nBy KANNADASAN | 9994960228"));
  sender.sendSms(new SmsMessage(numb,
      "Your Water Filter Service date is $pdate\nLast filter replace date $pdate1\nEvery 3 months once filter change for long life of machine.\nBK WATER SOLUTION"));
  // "Your Water Filter Service date is $pdate\nLast filter replace date $pdate1\nEvery 3 months once filter change for long life of machine.\nSMART AQUA PURIFIER"));
}

//  "Your Water Filter Service date is $pdate\nLast filter replace date $pdate1\nEvery 3 months once filter change for long life of machine.\nBK WATER SOLUTION"));
// Balachandar | 9524989863
