part of 'home_bloc.dart';

//@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<Photo> photos;

  const HomeLoadedState(this.photos);

  @override
  List<Object> get props => [photos];
}

class HomeFailureState extends HomeState {
  final String error;

  const HomeFailureState(this.error);
}
