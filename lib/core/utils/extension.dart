import 'package:intl/intl.dart' as init;

extension ToDate on String? {
  String getDate() =>
      init.DateFormat('yyyy-MM-dd').format(DateTime.parse(this!)).toString();

  String getTime() =>
      init.DateFormat.jm().format(DateTime.parse(this!)).toString();
}
