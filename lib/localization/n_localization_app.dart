import '../lib_exp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class NLocalizationApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String? loacleName; // en, ms, zh, tl

  final String? fontFamily;
  final Color primaryColor;
  final Color scaffoldBackgroundColor;

  final Widget home;

  const NLocalizationApp({
    super.key,
    required this.navigatorKey,
    this.loacleName,
    this.fontFamily,
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
    required this.home,
  });

  @override
  State<NLocalizationApp> createState() => NLocalizationAppState();

  static NLocalizationAppState of(BuildContext context) =>
      context.findAncestorStateOfType<NLocalizationAppState>()!;
}

class NLocalizationAppState extends State<NLocalizationApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();

    String loacleName = 'my';

    try {
      final platformLocaleName = Platform.localeName.toLowerCase();
      if (platformLocaleName.startsWith('my')) {
        loacleName = 'my';
      } else if (platformLocaleName.startsWith('en')) {
        loacleName = 'en';
      }
    } catch (_) {}

    _locale = Locale.fromSubtags(languageCode: loacleName);
  }

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: widget.fontFamily,
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 12),
        ),
        primaryColor: widget.primaryColor,
        scaffoldBackgroundColor: widget.scaffoldBackgroundColor,
      ),
      localizationsDelegates: const [
        NAppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('my', ''),
      ],
      locale: _locale,
      home: widget.home,
    );
  }
}
