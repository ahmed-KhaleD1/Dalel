import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/utils/firebase_keys.dart';
import 'package:dalel/features/home/data/models/war_model.dart';

class HistoricalCharacterModel extends HistoricalDataModel {
  final List<WarModel> wars;
  HistoricalCharacterModel(
      {required super.image,
      required super.name,
      required super.description,
      required this.wars});

  factory HistoricalCharacterModel.fromJson(json, List<WarModel> warsList) =>
      HistoricalCharacterModel(
        image: json[FirebaseKeys.image],
        name: json[FirebaseKeys.name],
        description: json[FirebaseKeys.description],
        wars: warsList,
      );
}
