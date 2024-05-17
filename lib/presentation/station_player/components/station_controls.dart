import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/provider/playing_station_provider.dart';
import '../../common/widgets/button/play_pause_button.dart';

class StationControls extends ConsumerWidget {
  const StationControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playingStationPresenter = ref.watch(playingStationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /* IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(
              Icons.skip_previous,
              size: 50,
            ),
          ), */
          PlayPauseButton(
            size: 100,
            isPlaying: playingStationPresenter.isPlaying,
            loadingPlay: playingStationPresenter.loadingPlay,
            onPressed: () {
              if (playingStationPresenter.isPlaying) {
                playingStationPresenter.pause();
              } else {
                playingStationPresenter.play();
              }
            },
          ),
          /*  IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(
              Icons.skip_next,
              size: 50,
            ),
          ), */
        ],
      ),
    );
  }
}
