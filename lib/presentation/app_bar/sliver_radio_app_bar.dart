import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/provider/filters_provider.dart';
import 'components/filter_list.dart';
import 'components/station_list_toggle.dart';
import 'components/station_search_bar.dart';

class SliverRadioAppBar extends ConsumerWidget {
  const SliverRadioAppBar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.searchLoading,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final bool searchLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFilters = ref.watch(filtersProvider).showFilters;

    return SliverAppBar(
      title: const Text('Radio Stations'),
      floating: true,
      snap: true,
      expandedHeight: showFilters ? 220 : 170,
      surfaceTintColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StationSearchBar(
              controller: searchController,
              onChanged: onSearchChanged,
              searchLoading: searchLoading,
            ),
            if (showFilters)
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: FilterList(),
              ),
            const StationListToggle(),
          ],
        ),
      ),
    );
  }
}
