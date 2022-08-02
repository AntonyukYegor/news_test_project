extension DateTimeToShortString on DateTime {
  String toShort() =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}
