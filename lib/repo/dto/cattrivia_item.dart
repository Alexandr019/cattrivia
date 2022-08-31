import 'package:hive/hive.dart';

part 'cattrivia_item.g.dart';

@HiveType(typeId: 0, adapterName: "MyCatData")
class CatData {
  @HiveField(0)
  final String fact;

  @HiveField(1)
  final DateTime dateCreation;

  CatData({
    required this.fact,
    required this.dateCreation,
  });

  factory CatData.fromJson(Map<String, dynamic> json, DateTime dateCreation) =>
      CatData(
        fact: json['data'][0]['fact'],
        dateCreation: dateCreation,
      );
}
