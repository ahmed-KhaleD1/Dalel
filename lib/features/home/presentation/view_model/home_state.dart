abstract class HomeState {
  const HomeState();
}

class HomeIniailState extends HomeState {}

class GetHistoricalPeriodsLoadingState extends HomeState {}

class GetHistoricalPeriodsSuccessState extends HomeState {}

class GetHistoricalPeriodsFailureState extends HomeState {
  final String errorMessage;

  GetHistoricalPeriodsFailureState({required this.errorMessage});
}
