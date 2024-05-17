import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/station/station.dart';
import '../common/hooks/use_init_hook.dart';
import '../common/provider/add_favorite_provider.dart';
import '../common/provider/is_favorite_provider.dart';
import '../common/provider/remove_favorite_provider.dart';
import '../common/request_provider/request_state.dart';
import '../common/widgets/favorite_button/favorite_button.dart';
import '../common/widgets/image/station_image.dart';
import 'components/station_controls.dart';
import 'components/stationg_tags.dart';

class StationPlayerScreen extends HookConsumerWidget {
  const StationPlayerScreen({
    super.key,
    required this.station,
  });

  final Station station;

  static MaterialPageRoute<StationPlayerScreen> route({
    required Station station,
  }) {
    return MaterialPageRoute<StationPlayerScreen>(
      settings: RouteSettings(name: '$StationPlayerScreen'),
      builder: (BuildContext context) => StationPlayerScreen(
        station: station,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInitAsync(
      () => ref.read(isFavoriteProvider).isFavorite(
            id: station.id,
          ),
    );

    final isFavorite = ref.watch(isFavoriteProvider).state.maybeWhen(
          success: (isFavorite) => isFavorite,
          loading: (isFavorite) => false,
          failure: (error) => false,
          orElse: () => false,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Station player'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 50),
          StationImage(
            size: 200,
            favicon: station.favicon,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  station.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ref.read(isFavoriteProvider).state.isLoading
                  ? const CircularProgressIndicator()
                  : FavoriteButton(
                      favorite: isFavorite,
                      onTap: () {
                        if (isFavorite) {
                          ref
                              .read(removeFavoriteProvider)
                              .removeFavorite(id: station.id);
                          ref.read(isFavoriteProvider).isFavorite(
                                id: station.id,
                              );
                        } else {
                          ref
                              .read(addFavoriteProvider)
                              .addFavorite(station: station);
                          ref.read(isFavoriteProvider).isFavorite(
                                id: station.id,
                              );
                        }
                      },
                    ),
            ],
          ),
          Text('${station.votes} Votes', style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          Text(
            station.country,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (station.tags.isNotEmpty)
            StationTags(
              tags: station.tags,
            ),
          const SizedBox(height: 100),
          const StationControls(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
