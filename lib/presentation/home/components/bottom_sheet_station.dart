import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/station/station.dart';
import '../../common/provider/playing_station_provider.dart';
import '../../common/widgets/button/play_pause_button.dart';
import '../../common/widgets/image/station_image.dart';
import '../../station_player/station_player_screen.dart';

class BottomSheetStation extends ConsumerWidget {
  final Station station;

  const BottomSheetStation({
    super.key,
    required this.station,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playingStationPresenter = ref.watch(playingStationProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () =>
                    ref.read(playingStationProvider).setPlayingStation(null),
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(
                  StationPlayerScreen.route(
                    station: station,
                  ),
                ),
                child: Row(
                  children: [
                    StationImage(
                      size: 80,
                      favicon: station.favicon,
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 180,
                      child: Text(
                        station.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              PlayPauseButton(
                loadingPlay: playingStationPresenter.loadingPlay,
                isPlaying: playingStationPresenter.isPlaying,
                onPressed: () {
                  if (playingStationPresenter.isPlaying) {
                    ref
                        .read(playingStationProvider.notifier)
                        .setPlayingStation(null);
                  } else {
                    ref
                        .read(playingStationProvider.notifier)
                        .setPlayingStation(station);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
