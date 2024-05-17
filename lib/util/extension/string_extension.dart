extension StringExtension on String {
  bool containsCharactersOrNumbers() {
    final regExp = RegExp(r'[a-zA-Z0-9]');
    return regExp.hasMatch(this);
  }
}
