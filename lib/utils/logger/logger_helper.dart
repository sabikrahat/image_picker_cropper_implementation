import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);
