part of 'shoes_cubit.dart';

abstract class ShoesState extends Equatable {
  const ShoesState();

  @override
  List<Object> get props => [];
}

class ShoesInitial extends ShoesState {}

class ShoesLoaded extends ShoesState {
  final List<Shoes> shoes;

  ShoesLoaded(this.shoes);

  @override
  List<Object> get props => [shoes];
}

class ShoesLoadingFailed extends ShoesState {
  final String message;

  ShoesLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
