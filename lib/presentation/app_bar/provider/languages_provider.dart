import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/d_injection/inject_dependencies.dart';
import '../../../controller/filter/filter_controller.dart';
import '../../../model/language/language.dart';
import '../../common/request_provider/request_provider.dart';

final languagesProvider =
    ChangeNotifierProvider((ref) => LanguagesPresenter(getIt()));

class LanguagesPresenter extends RequestProvider<List<Language>> {
  LanguagesPresenter(this._filterController);

  final FilterController _filterController;

  void getLanguages() =>
      executeRequest(requestBuilder: _filterController.getLanguages);
}
