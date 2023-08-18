import 'package:cat_app/dependency_injection/dependecies_injection.dart';
import 'package:cat_app/screens/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocProvider<HomeCubit> homeCubitProvider() {
  return BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(
      breedApi: getIt.get(),
    ),
  );
}
