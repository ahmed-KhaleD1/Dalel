import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/utils/firebase_keys.dart';

class HistoricalSouvenirsModel extends HistoricalDataModel {
  const HistoricalSouvenirsModel(
      {required super.name, required super.image, required super.description});
  factory HistoricalSouvenirsModel.fromJson(Map<String, dynamic> json) =>
      HistoricalSouvenirsModel(
          name: json[FirebaseKeys.name],
          image: json[FirebaseKeys.image],
          description: '');
}
