import 'package:intl/intl.dart';
import 'package:sms_maintained/sms.dart';

void sendSms(String numb, String date, String date1) {
  SmsSender sender = new SmsSender();
  String pdate = DateFormat('dd/MM/yyy').format(DateTime.parse(date ?? ''));
  String pdate1 = DateFormat('dd/MM/yyy').format(DateTime.parse(date1 ?? ''));
  sender.sendSms(new SmsMessage(numb,
      "\nSMART AQUA FILTER SERCIVE REMINDER\n By BALACHANDER \n 9524989863"));
  sender.sendSms(new SmsMessage(numb,
      "Your Water Filter Service date is $pdate\nLast filter replace date $pdate1\nEvery 3 months once filter change for long life of machine.\nSMART AQUA PURIFIER"));
}
