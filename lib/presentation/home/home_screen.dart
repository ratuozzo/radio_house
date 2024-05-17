import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/debouncer.dart';
import '../app_bar/sliver_radio_app_bar.dart';
import '../common/hooks/use_init_hook.dart';
import '../common/provider/favorite_station_list_provider.dart';
import '../common/provider/playing_station_provider.dart';
import '../common/request_provider/request_state.dart';
import 'components/bottom_sheet_station.dart';
import 'components/home_screen_body.dart';
import 'provider/stations_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInitAsync(() {
      ref.read(stationsProvider).getStations();
      ref.read(favoriteStationListProvider).getFavorites();
    });

    final playingStationPresenter = ref.watch(playingStationProvider);

    final searchDebouncer = Debouncer(const Duration(milliseconds: 300));

    final searchController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverRadioAppBar(
              searchController: searchController,
              searchLoading: ref.read(stationsProvider).state.isLoading &&
                  searchController.text.isNotEmpty,
              //searchLoading: true,
              onSearchChanged: (value) {
                if (value.isEmpty) {
                  ref.read(stationsProvider).getStations();
                } else {
                  searchDebouncer.run(() {
                    ref.read(stationsProvider).getStations(query: value);
                  });
                }
              }
            ),
            ref.watch(stationsProvider).state.isLoading
                ? const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const HomeScreenBody(),
          ],
        ),
      ),
      bottomSheet: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: playingStationPresenter.station != null
            ? BottomSheetStation(station: playingStationPresenter.station!)
            : const SizedBox.shrink(),
      ),
    );
  }
}
