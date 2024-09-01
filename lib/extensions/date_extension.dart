import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String toShortDateString() {
    return DateFormat('MM/dd/yyyy').format(this);
  }
}
