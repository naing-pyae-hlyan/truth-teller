import 'lib_exp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MyImageScaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(
              size: 128,
            ),
            verticalHeight32,
            MyGradientButton(
              label: 'Play',
              onTap: () {},
            ),
            verticalHeight8,
            MyGradientButton(
              label: 'Truts',
              onTap: () {},
            ),
            verticalHeight8,
            MyGradientButton(
              label: 'Dare',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
