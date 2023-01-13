import '../../lib_exp.dart';

class WheelModel<T> {
  final Widget foreground;
  final Color? backgroundColor;
  final T value;
  WheelModel({
    required this.foreground,
    this.backgroundColor,
    required this.value,
  });
}
