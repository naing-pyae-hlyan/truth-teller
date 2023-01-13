import '../../lib_exp.dart';

class PlayHomePage extends StatefulWidget {
  const PlayHomePage({super.key});

  @override
  State<PlayHomePage> createState() => _PlayHomePageState();
}

class _PlayHomePageState extends State<PlayHomePage> {
  @override
  Widget build(BuildContext context) {
    return MyImageScaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBar(
        context,
        addCloseButton: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          myText('ကစားရန် Mode များ',
              fontSize: 24, fontWeight: FontWeight.w700),
          verticalHeight32,
          MyGradientButton(
            label: 'အရက်သမားများသာ',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gradientColors: const [
              primaryColor,
              thirdaryColor,
              fourtharyColor,
            ],
            onTap: () =>
                context.push(const AddPlayerPage(playMode: PlayMode.alcholic)),
          ),
          verticalHeight12,
          MyGradientButton(
            label: 'သူငယ်ချင်းများ',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gradientColors: const [
              Colors.indigo,
              thirdaryColor,
              fourtharyColor,
            ],
            onTap: () =>
                context.push(const AddPlayerPage(playMode: PlayMode.friends)),
          ),
          verticalHeight12,
          MyGradientButton(
            label: 'အီစီကလီ',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gradientColors: const [
              Colors.purple,
              thirdaryColor,
              fourtharyColor,
            ],
            onTap: () {},
          ),
          verticalHeight12,
          MyGradientButton(
            label: 'စောင်အတွဲများ',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gradientColors: const [
              Colors.pink,
              thirdaryColor,
              fourtharyColor,
            ],
            onTap: () {},
          ),
          const Spacer(),
          backToHomeButton(context),
        ],
      ),
    );
  }
}
