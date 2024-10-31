extension StringExtension on String? {
  bool isNotBlank() => this?.trim().isNotEmpty ?? false;
}
