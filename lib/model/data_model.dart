import '../lib_exp.dart';

part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final int? level;

  @HiveField(2)
  final List<int> modes;

  DataModel({
    required this.text,
    this.level,
    required this.modes,
  });
}


// class JsonDataModel {
//   String key;
//   JsonData jsonData;
//   JsonDataModel({required this.key, required this.jsonData});
//   factory JsonDataModel.fromJson(Map<String, dynamic> json) => JsonDataModel(
//         key: json['key'],
//         jsonData: JsonData.fromJson(json['data']),
//       );

//   Map<String, dynamic> toJson() => {
//         'key': key,
//         'data': jsonData.toJson(),
//       };
// }

// class JsonData {
//   int id;
//   String data;
//   bool isDare;
//   int? level;
//   JsonData({
//     required this.id,
//     required this.data,
//     required this.isDare,
//     this.level,
//   });
//   factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
//         id: json['id'],
//         data: json['data'],
//         isDare: json['is_dare'],
//         level: json['level'],
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'data': data,
//         'is_dare': isDare,
//         'level': level,
//       };
// }
