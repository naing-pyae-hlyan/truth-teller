import '../lib_exp.dart';

class NAppLocalizations {
  final Locale locale;

  NAppLocalizations(this.locale);

  static NAppLocalizations of(BuildContext context) =>
      Localizations.of<NAppLocalizations>(
        context,
        NAppLocalizations,
      )!;

  String get(String key) {
    try {
      final v = _localizeValues[key]![locale.languageCode]!;

      return v.isEmpty ? key : v;
    } catch (_) {
      return key;
    }
  }

  static final Map<String, Map<String, String>> _localizeValues = {
    '': {
      'en': '',
      'my': '',
    },
  };
}

class NAppLocalizationsDelegate
    extends LocalizationsDelegate<NAppLocalizations> {
  const NAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'my',
      ].contains(locale.languageCode);

  @override
  Future<NAppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async 'load' operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<NAppLocalizations>(NAppLocalizations(locale));
  }

  @override
  bool shouldReload(NAppLocalizationsDelegate old) => false;
}
