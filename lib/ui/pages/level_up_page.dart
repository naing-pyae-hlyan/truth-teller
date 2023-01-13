import '../../lib_exp.dart';

class LevelUpPage extends StatefulWidget {
  final PlayMode playMode;
  const LevelUpPage({
    required this.playMode,
    super.key,
  });

  @override
  State<LevelUpPage> createState() => _LevelUpPageState();
}

class _LevelUpPageState extends State<LevelUpPage> {
  @override
  void initState() {
    doAfterBuild(
      callback: () => context.pushReplacement(
        GamePage(
          playMode: widget.playMode,
          userList: <UserModel>[],
        ),
      ),
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyImageScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          myText('Level One'),
        ],
      ),
    );
  }
}
