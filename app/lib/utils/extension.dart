extension StringExtension on String? {
  bool isNotBlank() => this != null && this?.trim().isNotEmpty == true;
}
