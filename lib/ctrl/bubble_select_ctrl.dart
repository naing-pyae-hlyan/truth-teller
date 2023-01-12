import '../lib_exp.dart';

class BubbleSelectCtrl with ChangeNotifier {
  final List<PlayModeModel> _playModeModel = [];
  List<PlayModeModel> get checkList => _playModeModel;
  init() {
    _playModeModel.clear();
    for (var mode in PlayMode.values) {
      _playModeModel.add(PlayModeModel(mode: mode, selected: true));
    }
  }

  List<int> getModes() {
    List<int> modes = [];
    for (PlayModeModel model in _playModeModel) {
      if (model.selected) {
        modes.add(model.mode.index);
      }
    }
    return modes;
  }

  void onSelect(PlayMode mode, {bool? select}) {
    for (PlayModeModel model in _playModeModel) {
      if (model.mode == mode) {
        model.selected = select ?? !model.selected;
      }
    }
    notifyListeners();
  }
}
