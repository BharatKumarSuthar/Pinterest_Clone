import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format() => DateFormat("MMM d, yyy").format(this);
}
