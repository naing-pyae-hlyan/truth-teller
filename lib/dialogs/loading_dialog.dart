import '../lib_exp.dart';

class Loading {
  static void show(BuildContext context) => context.loaderOverlay.show();
  static void hide(BuildContext context) => context.loaderOverlay.hide();
}
