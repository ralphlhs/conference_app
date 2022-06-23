import 'package:intl/intl.dart';

extension DateTimeAdd on DateTime {
  String toyMMMd(){
    return DateFormat.yMMMd().format(this);
  }
}