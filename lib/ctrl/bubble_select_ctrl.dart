import '../lib_exp.dart';

class BubbleSelectCtrl with ChangeNotifier {
  bool _selectAll = false;
  bool get selectAll => _selectAll;

  final List<PlayModeModel> _playModeModels = [];
  List<PlayModeModel> get checkList => _playModeModels;
  init() {
    _playModeModels.clear();
    _selectAll = false;
    for (var mode in PlayMode.values) {
      _playModeModels.add(PlayModeModel(mode: mode, selected: false));
    }
  }

  List<int> getModes() {
    List<int> modes = [];
    for (PlayModeModel model in _playModeModels) {
      if (model.selected) {
        modes.add(model.mode.index);
      }
    }
    return modes;
  }

  void onSelect(PlayMode mode, {bool? select}) {
    for (PlayModeModel model in _playModeModels) {
      if (model.mode == mode) {
        model.selected = select ?? !model.selected;
      }
    }
    _selectAll = _playModeModels.every((e) => e.selected);
    notifyListeners();
  }

  void onSelectAll(bool selectAll) {
    for (PlayModeModel model in _playModeModels) {
      model.selected = selectAll;
    }
    _selectAll = selectAll;
    notifyListeners();
  }
}
