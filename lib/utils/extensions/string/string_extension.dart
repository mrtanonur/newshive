extension StringExtension on String {
  String captalizeFirstLetter() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
