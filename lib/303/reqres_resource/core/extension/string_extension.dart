extension StringExtension on String? {
  int? get colorValue {
    final String? newColor = this?.replaceFirst('#', '0xFF');
    return int.parse(newColor ?? '');
  }
}