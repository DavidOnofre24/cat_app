import 'package:cat_app/dependency_injection/breed.dart';
import 'package:cat_app/dependency_injection/core.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await configureCore(getIt);
  configureBreeds(getIt);
  await getIt.allReady();
}
