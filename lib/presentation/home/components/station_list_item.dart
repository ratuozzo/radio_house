import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/station/station.dart';
import '../../common/provider/playing_station_provider.dart';
import '../../common/widgets/button/play_pause_button.dart';
import '../../common/widgets/image/station_image.dart';
import '../../station_player/station_player_screen.dart';

class StationListItem extends ConsumerWidget {
  const StationListItem({
    super.key,
    required this.station,
  });

  final Station station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playingStationPresenter = ref.watch(playingStationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {
          playingStationPresenter.setStation(station);
          Navigator.of(context)
              .push(StationPlayerScreen.route(station: station));
        },
        splashColor: Colors.transparent,
        leading: StationImage(
          favicon: station.favicon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.name.isEmpty ? 'No name station' : station.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Votes: ${station.votes}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: PlayPauseButton(
          loadingPlay: station == playingStationPresenter.station &&
              playingStationPresenter.loadingPlay,
          isPlaying: station == playingStationPresenter.station &&
              playingStationPresenter.isPlaying,
          onPressed: () {
            if (playingStationPresenter.isPlaying &&
                station == playingStationPresenter.station) {
              playingStationPresenter.setPlayingStation(null);
            } else {
              playingStationPresenter.setPlayingStation(station);
            }
          },
        ),
      ),
    );
  }
}
