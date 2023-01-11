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
      body: Column(
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
            label: 'Add Truths',
            onTap: () => context.push(const AddDareTruthPage(isDare: false)),
          ),
          verticalHeight8,
          MyGradientButton(
            label: 'Add Dares',
            onTap: () => context.push(const AddDareTruthPage(isDare: true)),
          ),
        ],
      ),
    );
  }
}
