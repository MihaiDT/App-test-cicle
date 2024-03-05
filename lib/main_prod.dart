import 'package:lines/flavors.dart';

import 'package:lines/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
}
