import 'package:get/get.dart';
import 'package:lines/core/env/enviroment.dart';
import 'package:lines/core/env/prod_env.dart';
import 'package:lines/core/env/staging_env.dart';
import 'package:lines/flavors.dart';

void dependencyRegister({
  required Flavor flavor,
}) {
  Get.put<Environment>(
    flavor.isDevFlavor ? StagingEnv() : ProdEnv(),
  );
}
