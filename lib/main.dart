import 'lib_exp.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

FToast fToast = FToast();
void main() async {
  ErrorWidget.builder =
      (FlutterErrorDetails error) => MyErrorWidget(error: error);
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  await HiveHelper.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataCtrl()),
        ChangeNotifierProvider(create: (_) => BubbleSelectCtrl()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.white,
      overlayWidget: const LoadingWidget(),
      child: NLocalizationApp(
        navigatorKey: navigatorKey,
        // fontFamily: 'Urbanist',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        home: const SplashPage(),
      ),
    );
  }
}

class MyErrorWidget extends StatelessWidget {
  final FlutterErrorDetails error;
  const MyErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            'Oops!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 4.0,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      error.exception.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: error.exception.toString()),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied To Clipboard')),
                  );
                },
                child: const Text('Copy To Clipboard'),
              ),
            ],
          ),
        ),
      );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SpinKitChasingDots(
              color: primaryColor,
              size: 50,
            ),
            const SizedBox(height: 32),
            Text(
              'Loading'.lz,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
