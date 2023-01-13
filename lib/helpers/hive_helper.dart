import '../lib_exp.dart';
// ignore: library_prefixes
import 'package:path_provider/path_provider.dart' as pathProvider;

const trustsBoxName = 'trusts_box';
const daresBoxName = 'dares_box';
const usersBoxName = 'users_box';

class HiveHelper {
  HiveHelper._constructor();
  static final HiveHelper _instance = HiveHelper._constructor();
  factory HiveHelper() => _instance;

  static late Box<DataModel> _dareBox;
  static late Box<DataModel> _truthBox;
  static late Box<UserModel> _userBox;

  static Future<void> init() async {
    Directory dir = await pathProvider.getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter<DataModel>(DataModelAdapter())
      ..registerAdapter<UserModel>(UserModelAdapter());

    _dareBox = await Hive.openBox<DataModel>(daresBoxName);
    _truthBox = await Hive.openBox<DataModel>(trustsBoxName);
    _userBox = await Hive.openBox<UserModel>(usersBoxName);

    //TODO create default data and need to check is already created?
  }

  static Box<DataModel> boxDareOrTruth(bool isDare) =>
      isDare ? _dareBox : _truthBox;

  static void addDareOrTruth(
    DataModel data, {
    required bool isDare,
  }) {
    try {
      isDare ? _dareBox.add(data) : _truthBox.add(data);
    } catch (e) {
      showToast(e.toString());
    }
  }

  static void deleteDareOrTruth(
    int id, {
    required bool isDare,
  }) {
    try {
      isDare ? _dareBox.delete(id) : _truthBox.delete(id);
    } catch (e) {
      showToast(e.toString());
    }
  }

  static Box<UserModel> boxUser() => _userBox;
  static void addUser(UserModel data) {
    try {
      _userBox.add(data);
    } catch (e) {
      showToast(e.toString());
    }
  }

  static void deleteUser(int id) {
    try {
      _userBox.delete(id);
    } catch (e) {
      showToast(e.toString());
    }
  }

  static List<UserModel> getUserList() {
    try {
      final List<UserModel> result = _userBox.values as List<UserModel>;
      return result;
    } catch (e) {
      showToast(e.toString());
      return [];
    }
  }
}
