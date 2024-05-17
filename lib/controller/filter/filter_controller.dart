import 'package:injectable/injectable.dart';

import '../../model/country/country.dart';
import '../../model/language/language.dart';
import '../../repository/filter/filter_repository.dart';

abstract class FilterController {
  Future<List<Language>> getLanguages();
  Future<List<Country>> getCountries();
}

@LazySingleton(as: FilterController)
class FilterControllerImpl implements FilterController {
  FilterControllerImpl(
    this._filterRepository,
  );

  final FilterRepository _filterRepository;

  @override
  Future<List<Language>> getLanguages() async {
    final output = <Language>[];
    final languages = await _filterRepository.getLanguages();
    for (final language in languages) {
      if (language.name.isNotEmpty) {
        output.add(language);
      }
    }
    output.sort((a, b) => a.name.compareTo(b.name));
    return output;
  }

  @override
  Future<List<Country>> getCountries() async {
    final output = <Country>[];
    final countries = await _filterRepository.getCountries();
    for (final country in countries) {
      if (country.name.isNotEmpty) {
        output.add(country);
      }
    }
    output.sort((a, b) => a.name.compareTo(b.name));
    return output;
  }
}
