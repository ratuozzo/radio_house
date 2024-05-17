import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/provider/filters_provider.dart';
import '../../home/provider/stations_provider.dart';

class StationSearchBar extends ConsumerWidget {
  const StationSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.searchLoading,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool searchLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(filtersProvider).countryFilter != null ||
        ref.watch(filtersProvider).languageFilter != null;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchLoading
                    ? Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(
                          strokeWidth: 6,
                        ),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              if (hasFilters) {
                ref.read(filtersProvider).clearFilters();
                ref.read(stationsProvider).getStations();
              } else {
                ref.read(filtersProvider).toggleFilters();
              }
            },
            icon: Icon(
              hasFilters ? Icons.close : Icons.filter_list,
            ),
          ),
        ],
      ),
    );
  }
}
