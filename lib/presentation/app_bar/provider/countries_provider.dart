import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/filter/filter_controller.dart';
import '../../../model/country/country.dart';
import '../../common/request_provider/request_provider.dart';

final countriesProvider =
    ChangeNotifierProvider((ref) => CountriesPresenter(getIt()));

class CountriesPresenter extends RequestProvider<List<Country>> {
  CountriesPresenter(this._filterController);

  final FilterController _filterController;

  void getCountries() =>
      executeRequest(requestBuilder: _filterController.getCountries);
}
