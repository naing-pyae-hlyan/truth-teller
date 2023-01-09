import '../main.dart';
import '_localization_exp.dart';

extension NLocalizationExtension on String {
  String get lz => navigatorKey.currentContext == null
      ? this
      : NAppLocalizations.of(navigatorKey.currentContext!).get(this);
}
