import 'package:cat_app/api/breed_api.dart';
import 'package:get_it/get_it.dart';

configureBreeds(GetIt getIt) {
  getIt.registerFactory<BreedApi>(
    () => BreedApi(
      client: getIt.get(),
    ),
  );
}
