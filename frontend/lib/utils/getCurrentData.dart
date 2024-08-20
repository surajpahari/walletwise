import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime today = DateTime.now();
  String formattedDate = DateFormat('MMMM d yyyy').format(today);
  return formattedDate;
}
