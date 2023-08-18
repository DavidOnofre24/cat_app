import 'package:cat_app/api/breed_api.dart';
import 'package:cat_app/models/breed.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedApi breedApi;
  HomeCubit({
    required this.breedApi,
  }) : super(HomeInitial());

  Future<void> getBreeds() async {
    emit(HomeLoading());
    try {
      final List<Breed> breeds = await breedApi.fetchBreeds();
      emit(HomeLoaded(breeds: breeds));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
