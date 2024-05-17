import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/show_favorites_provider.dart';
import 'favorite_stations_list.dart';
import 'stations_list.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFavorites = ref.watch(showFavoritesProvider);

    if (showFavorites) {
      return const FavoriteStationsList();
    }
    return const StationsList();
  }
}
