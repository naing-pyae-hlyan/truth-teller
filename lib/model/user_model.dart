import '../lib_exp.dart';
part 'user_model.g.dart';


@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String playerName;
  UserModel({required this.playerName});
}
