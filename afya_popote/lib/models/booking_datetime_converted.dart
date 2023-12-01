import 'package:intl/intl.dart';

//this basically is to convert date/day/time from calendar to string
class DateConverted {
  static String getDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static String getDay(int day) {
    switch (day) {
      case 1:
        return 'Jumatatu';
      case 2:
        return 'Jumanne';
      case 3:
        return 'Jumatano';
      case 4:
        return 'Alhamis';
      case 5:
        return 'Ijumaa';
      case 6:
        return 'Jumamosi';
      case 7:
        return 'Jumapili';
      default:
        return 'Jumapili';
    }
  }

  static String getTime(int time) {
    switch (time) {
      case 0:
        return '08:00 Asubuhi';
      case 1:
        return '09:00 Asubuhi';
      case 2:
        return '10:00 Asubuhi';
      case 3:
        return '11:00 Mchana';
      case 4:
        return '12:00 Mchana';
      case 5:
        return '13:00 Mchana';
      case 6:
        return '14:00 Mchana';
      case 7:
        return '15:00 Mchana';
      default:
        return '08:00 Asubuhi';
    }
  }
}
