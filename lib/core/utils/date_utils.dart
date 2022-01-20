import 'package:intl/intl.dart';

String getFormattedDate(String dateTimeString, {String? formatString}) {
  final formatter = DateFormat(
    formatString ?? 'EEEE, MMM d, yyyy',
  );
  final formattedDate = formatter.format(DateTime.parse(dateTimeString));
  return formattedDate;
}
