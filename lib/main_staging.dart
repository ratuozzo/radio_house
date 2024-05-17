import 'app/flavor_config.dart';
import 'run_app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.staging,
    name: 'Staging',
    values: FlavorValues(
      baseUrl: 'https://at1.api.radio-browser.info',
    ),
  );
  runRadioApp();
}
