import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/provider/show_favorites_provider.dart';
import 'toggle_button.dart';

class StationListToggle extends ConsumerWidget {
  const StationListToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFavorites = ref.watch(showFavoritesProvider);

    return Row(
      children: [
        ToggleButton(
          text: 'All',
          active: !showFavorites,
          onTap: () => ref.read(showFavoritesProvider.notifier).state = false,
        ),
        ToggleButton(
          text: 'Favorites',
          active: showFavorites,
          onTap: () => ref.read(showFavoritesProvider.notifier).state = true,
        ),
      ],
    );
  }
}
