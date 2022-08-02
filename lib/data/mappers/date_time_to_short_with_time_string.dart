import 'package:news_test_project/data/mappers/date_time_to_short_string.dart';
import 'package:news_test_project/data/mappers/date_time_to_time_string.dart';

extension DateTimeToShortWithTimeString on DateTime {
  String toShortWithTime() => '${toShort()} ${toShortTime()}';
}
