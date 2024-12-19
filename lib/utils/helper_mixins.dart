import 'package:intl/intl.dart';

mixin LoggerMixin {
  void log(String message) {
    print("[LOG]: $message");
  }
}

mixin DateFormatterMixin {
  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
