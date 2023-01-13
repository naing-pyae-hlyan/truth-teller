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


