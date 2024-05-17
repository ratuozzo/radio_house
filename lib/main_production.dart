import 'app/flavor_config.dart';
import 'run_app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    name: 'Production',
    values: FlavorValues(
      baseUrl: 'https://production.com',
    ),
  );
  runRadioApp();
}
