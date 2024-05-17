import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final filtersProvider = ChangeNotifierProvider((ref) => FiltersPresenter());

class FiltersPresenter extends ChangeNotifier {
  bool showFilters = false;

  String? countryFilter;
  String? languageFilter;

  void toggleFilters() {
    showFilters = !showFilters;
    notifyListeners();
  }

  void clearFilters() {
    countryFilter = null;
    languageFilter = null;
    notifyListeners();
  }

  void setCountryFilter(String? country) {
    countryFilter = country;
    notifyListeners();
  }

  void setLanguageFilter(String? language) {
    languageFilter = language;
    notifyListeners();
  }
}
