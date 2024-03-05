import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/utils/firebase_keys.dart';
import 'package:dalel/features/home/data/models/war_model.dart';

class HistoricalPeriodsModel extends HistoricalDataModel {
  final List<WarModel> wars;
  HistoricalPeriodsModel(
      {required super.image,
      required super.name,
      required super.description,
      required this.wars});

  factory HistoricalPeriodsModel.fromJson(json, List<WarModel> warsList) =>
      HistoricalPeriodsModel(
        image: json[FirebaseKeys.image],
        name: json[FirebaseKeys.name],
        description: json[FirebaseKeys.description],
        wars: warsList,
      );
}
