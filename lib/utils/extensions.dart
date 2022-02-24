extension Strings on String {
  String get capitalized {
    return (isNotEmpty) ? substring(0, 1).toUpperCase() + substring(1) : "";
  }
}
