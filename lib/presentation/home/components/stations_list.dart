import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/station/station.dart';
import '../../common/provider/playing_station_provider.dart';
import '../provider/stations_provider.dart';
import 'station_list_item.dart';

class StationsList extends ConsumerWidget {
  const StationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(stationsProvider).state.maybeWhen<List<Station>>(
          success: (stations) => stations,
          loading: (stations) => stations ?? [],
          failure: (error) {
            //TODO handle error
            return [];
          },
          orElse: () => [],
        );

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (stations.isEmpty) {
            return const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  'No Stations',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
          if (index == stations.length) {
            return SizedBox(
              height:
                  ref.watch(playingStationProvider).station != null ? 220 : 30,
            );
          }
          return StationListItem(station: stations[index]);
        },
        childCount: stations.length + 1,
      ),
    );
  }
}
