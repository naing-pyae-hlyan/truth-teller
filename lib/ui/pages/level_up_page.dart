import '../../lib_exp.dart';

class LevelUpPage extends StatefulWidget {
  final PlayMode playMode;
  final List<UserModel> userList;
  const LevelUpPage({
    required this.playMode,
    required this.userList,
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
          userList: widget.userList,
        ),
      ),
      duration: const Duration(seconds: 2),
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
