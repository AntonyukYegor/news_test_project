extension DateTimeToTimeString on DateTime {
  String toShortTime() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}
