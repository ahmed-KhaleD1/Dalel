abstract class HomeState {
  const HomeState();
}

class HomeIniailState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String errorMessage;

  HomeFailureState({required this.errorMessage});
}
