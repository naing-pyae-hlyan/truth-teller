import '../../lib_exp.dart';

class WheelCtrl<T> extends ChangeNotifier {
  WheelModel<T>? value;
  bool isAnimating = false;
  bool shouldStartAnimation = false;

  void rotateWheel() {
    shouldStartAnimation = true;
    notifyListeners();
  }

  void animationStarted() {
    shouldStartAnimation = false;
    notifyListeners();
  }

  void setValue(WheelModel<T> wheel) {
    value = wheel;
    notifyListeners();
  }

  void animationFinished() {
    isAnimating = false;
    shouldStartAnimation = false;
    notifyListeners();
  }
}
