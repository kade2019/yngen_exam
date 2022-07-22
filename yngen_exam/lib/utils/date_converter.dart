import 'package:intl/intl.dart';

class DateConverter {
  static String dateToString(DateTime date){
    return DateFormat.yMMMMd().format(date);
  }
  static DateTime uctToDate(String date){
    return DateTime.parse(date);
  }
}