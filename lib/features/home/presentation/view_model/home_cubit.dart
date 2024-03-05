import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/firebase_keys.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/war_model.dart';
import 'package:dalel/features/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIniailState());
  List<HistoricalPeriodsModel> historicalPeriodsList = [];
  List<WarModel> warsList = [];

  Future<void> getHistoricalPeriodData() async {
    try {
      emit(GetHistoricalPeriodsLoadingState());

      await FirebaseFirestore.instance
          .collection(FirebaseKeys.historicalPeriods)
          .get()
          .then((value) => value.docs.forEach((element) async {
                await getWarsList(element);
                historicalPeriodsList.add(
                    HistoricalPeriodsModel.fromJson(element.data(), warsList));
                emit(GetHistoricalPeriodsSuccessState());
              }));
    } catch (e) {
      emit(GetHistoricalPeriodsFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getWarsList(element) async {
    await FirebaseFirestore.instance
        .collection(FirebaseKeys.historicalPeriods)
        .doc(element.id)
        .collection(FirebaseKeys.wars)
        .get()
        .then((value) => value.docs.forEach((element) {
              warsList.add(WarModel.fromJson(element.data()));
            }));
  }
}
