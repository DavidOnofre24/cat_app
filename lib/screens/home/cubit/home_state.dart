part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Breed> breeds;

  const HomeLoaded({
    required this.breeds,
  });

  @override
  List<Object> get props => [breeds];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
