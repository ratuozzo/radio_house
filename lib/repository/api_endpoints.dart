class ApiEndpoints {
  /// Get All Stations
  static String getStations() => '/json/stations?limit=100&hidebroken=true';

  /// Get All Stations by name
  static String searchStations({required String query}) =>
      '/json//stations/byname/$query?limit=20&hidebroken=true';

  /// Get All Stations by language
  static String getStationsByLanguage({required String language}) =>
      '/json/stations/bylanguage/$language?limit=100&hidebroken=true';

  /// Get All Stations by country
  static String getStationsByCountry({required String country}) =>
      '/json/stations/bycountry/$country?limit=100&hidebroken=true';

  /// Get All Languages
  static String getLanguages() => '/json/languages';

  /// Get All Countries
  static String getCountries() => '/json/countries';
}
