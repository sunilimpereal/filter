import 'package:sms_maintained/sms.dart';

void sendSms(String numb, String date) {
  SmsSender sender = new SmsSender();
  sender.sendSms(new SmsMessage(numb,
      "Your Water Purifier Filter replace date is $date\nBy SMART AQUA PURIFIER\nBala Chandar | 9534989863\nChange Outer Filter every three months for long life"));
}
