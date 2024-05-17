import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/country/country.dart';
import '../../../model/language/language.dart';
import '../../common/hooks/use_init_hook.dart';
import '../../common/provider/filters_provider.dart';
import '../../common/request_provider/request_state.dart';
import '../../home/provider/stations_provider.dart';
import '../provider/countries_provider.dart';
import '../provider/languages_provider.dart';
import 'station_filter_chip.dart';

class FilterList extends HookConsumerWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInitAsync(() {
      ref.read(countriesProvider).getCountries();
      ref.read(languagesProvider).getLanguages();
    });

    final countries =
        ref.watch(countriesProvider).state.maybeWhen<List<Country>>(
              success: (countries) => countries,
              loading: (countries) => countries ?? [],
              failure: (error) => [
                //TODO handle error
              ],
              orElse: () => [],
            );

    final languages =
        ref.watch(languagesProvider).state.maybeWhen<List<Language>>(
              success: (languages) => languages,
              loading: (languages) => languages ?? [],
              failure: (error) => [
                //TODO handle error
              ],
              orElse: () => [],
            );

    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          ref.watch(languagesProvider).state.isSuccess ||
                  (ref.watch(languagesProvider).state.isLoading &&
                      languages.isNotEmpty)
              ? StationFilterChip(
                  text: ref.watch(filtersProvider).languageFilter ?? 'Language',
                  onTap: (language) {
                    ref
                        .read(stationsProvider)
                        .getStationsByLanguage(language: language);
                    ref.read(filtersProvider).setCountryFilter(null);
                    ref.read(filtersProvider).setLanguageFilter(language);
                  },
                  dropdownItems: languages
                      .map(
                        (language) => language.name,
                      )
                      .toList(),
                )
              : const CircularProgressIndicator(),
          const SizedBox(width: 8),
          ref.watch(countriesProvider).state.isSuccess ||
                  (ref.watch(countriesProvider).state.isLoading &&
                      countries.isNotEmpty)
              ? StationFilterChip(
                  text: ref.watch(filtersProvider).countryFilter ?? 'Country',
                  onTap: (country) {
                    ref
                        .read(stationsProvider)
                        .getStationsByCountry(country: country);
                    ref.read(filtersProvider).setLanguageFilter(null);
                    ref.read(filtersProvider).setCountryFilter(country);
                  },
                  dropdownItems: countries
                      .map(
                        (country) => country.name,
                      )
                      .toList(),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
