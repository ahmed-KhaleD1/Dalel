import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/firebase_keys.dart';
import 'package:dalel/features/home/data/models/historical_characters_model.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/historical_souvenirs_model.dart';
import 'package:dalel/features/home/data/models/war_model.dart';
import 'package:dalel/features/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIniailState());
  List<HistoricalCharacterModel> historicalCharacterList = [];
  List<HistoricalSouvenirsModel> historicalSouvenirList = [];

  List<HistoricalPeriodsModel> historicalPeriodsList = [];
  List<WarModel> warsList = [];

  Future<void> getHomeData() async {
    try {
      emit(HomeLoadingState());
      await getHistoricalPeriodData();
      await getHistoricalCharactersData();
      await getHistoricalSouvenirsData();
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getHistoricalPeriodData() async {
    QuerySnapshot<Map<String, dynamic>> historicalPeriodsref =
        await FirebaseFirestore.instance
            .collection(FirebaseKeys.historicalPeriods)
            .get();

    for (var i = 0; i < historicalPeriodsref.docs.length; i++) {
      await getWarsList(historicalPeriodsref.docs[i]);
      historicalPeriodsList.add(HistoricalPeriodsModel.fromJson(
          historicalPeriodsref.docs[i].data(), warsList));
    }
  }

  Future<void> getHistoricalCharactersData() async {
    QuerySnapshot<Map<String, dynamic>> historicalCharacterRef =
        await FirebaseFirestore.instance
            .collection(FirebaseKeys.historicalCharacter)
            .get();
    for (int i = 0; i < historicalCharacterRef.docs.length; i++) {
      await getWarsList(historicalCharacterRef.docs[i]);
      historicalCharacterList.add(HistoricalCharacterModel.fromJson(
          historicalCharacterRef.docs[i].data(), warsList));
    }
  }

  Future<void> getHistoricalSouvenirsData() async {
    QuerySnapshot<Map<String, dynamic>> historicalSouvenirsRef =
        await FirebaseFirestore.instance
            .collection(FirebaseKeys.historicalSouvenirs)
            .get();
    for (int i = 0; i < historicalSouvenirsRef.docs.length; i++) {
      historicalSouvenirList.add(HistoricalSouvenirsModel.fromJson(
          historicalSouvenirsRef.docs[i].data()));
    }
  }

  Future<void> getWarsList(element) async {
    QuerySnapshot<Map<String, dynamic>> warCollection = await FirebaseFirestore
        .instance
        .collection(FirebaseKeys.historicalPeriods)
        .doc(element.id)
        .collection(FirebaseKeys.wars)
        .get();
    for (int i = 0; i < warCollection.docs.length; i++) {
      warsList.add(WarModel.fromJson(warCollection.docs[i].data()));
    }
  }
}
