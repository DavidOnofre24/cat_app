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

  final List<Breed> allBreeds = [];

  Future<void> getBreeds() async {
    emit(HomeLoading());
    try {
      final List<Breed> breeds = await breedApi.fetchBreeds();
      allBreeds.addAll(breeds);
      emit(HomeLoaded(breeds: breeds));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> searchBreeds(String query) async {
    if (query.isEmpty) {
      emit(HomeLoaded(breeds: allBreeds));
    }
    final currentState = state;
    if (currentState is HomeLoaded) {
      final List<Breed> breeds = allBreeds
          .where(
              (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(HomeLoaded(breeds: breeds));
    }
  }
}
