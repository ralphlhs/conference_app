import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

extension DateTimeAdd on DateTime {
  String toyMMMd(){
    return DateFormat.yMMMd().format(this);
  }
}