import '../lib_exp.dart';
// ignore: library_prefixes
import 'package:path_provider/path_provider.dart' as pathProvider;

const trustsBoxName = 'trusts_box';
const daresBoxName = 'dares_box';

class HiveHelper {
  HiveHelper._constructor();
  static final HiveHelper _instance = HiveHelper._constructor();
  factory HiveHelper() => _instance;

  static late Box<DataModel> _dareBox;
  static late Box<DataModel> _truthBox;

  static Future<void> init() async {
    Directory dir = await pathProvider.getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter<DataModel>(DataModelAdapter());

    _dareBox = await Hive.openBox<DataModel>(daresBoxName);
    _truthBox = await Hive.openBox<DataModel>(trustsBoxName);
    
    //TODO create default data and need to check is already created?
  }

  static void put(
    DataModel data, {
    required bool isDare,
  }) =>
      isDare ? _dareBox.add(data) : _truthBox.add(data);

  static Box<DataModel> box(bool isDare) => isDare ? _dareBox : _truthBox;

  static void delete(
    int id, {
    required bool isDare,
  }) =>
      isDare ? _dareBox.delete(id) : _truthBox.delete(id);
}
