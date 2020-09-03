import 'package:sms_maintained/sms.dart';

void sendSms(String numb) {
  SmsSender sender = new SmsSender();
  sender.sendSms(new SmsMessage(numb, "Your Filter is exp"));
}
