/// App flavors
enum Flavor {
  development,
  staging,
  production,
}

/// Values that can change between flavors
class FlavorValues {
  FlavorValues({
    required this.baseUrl,
  });

  final String baseUrl;
}

/// Config
class FlavorConfig {
  factory FlavorConfig({
    required String name,
    required Flavor flavor,
    required FlavorValues values,
  }) {
    name = name;
    flavor = flavor;
    values = values;
    return _instance = FlavorConfig._internal(flavor, values, name);
  }

  FlavorConfig._internal(this.flavor, this.values, this.name);

  final String name;
  final Flavor flavor;
  final FlavorValues values;

  static late FlavorConfig _instance;

  static FlavorConfig get instance => _instance;

  static bool get isProduction => _instance.flavor == Flavor.production;

  static bool get isStaging => _instance.flavor == Flavor.staging;

  static bool get isDevelopment => _instance.flavor == Flavor.development;

  static bool get hasRequestLogging => isStaging || isDevelopment;
}
