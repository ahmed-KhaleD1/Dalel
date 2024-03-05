import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/utils/firebase_keys.dart';

class WarModel extends HistoricalDataModel {
  const WarModel({
    required super.image,
    required super.name,
    required super.description,
  });
  factory WarModel.fromJson(Map<String, dynamic> json) => WarModel(
        image: json[FirebaseKeys.image],
        name: json[FirebaseKeys.name],
        description: json[FirebaseKeys.description],
      );
}
