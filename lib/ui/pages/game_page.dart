import '../../lib_exp.dart';

class GamePage extends StatefulWidget {
  final PlayMode playMode;
  final List<UserModel> userList;
  const GamePage({
    required this.playMode,
    required this.userList,
    super.key,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  WheelCtrl<int> wheelCtrl = WheelCtrl();
  WheelModel? currentWheel;
  int currentBalance = 0;

  @override
  void initState() {
    wheelCtrl.addListener(() {
      if (wheelCtrl.value == null) return;
      setState(() {
        currentWheel = wheelCtrl.value;
      });

      if (wheelCtrl.isAnimating) return;

      if (wheelCtrl.shouldStartAnimation) return;

      setState(() {
        currentBalance += wheelCtrl.value!.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyImageScaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBar(context, addCloseButton: true),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: currentBalance.isNegative ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: myText('Current Balance $currentBalance',
                fontSize: 18, color: Colors.white),
          ),
          verticalHeight24,
          Container(
            color: primaryColor.withOpacity(0.2),
            height: 80,
            width: 80,
            child:
                currentWheel != null ? currentWheel!.foreground : Container(),
          ),
          verticalHeight16,
          SizedBox(
            width: 350,
            height: 350,
            child: Wheel<int>(
              controller: wheelCtrl,
              children: [
                _createFortuneWheelChild(-50),
                _createFortuneWheelChild(1000),
                _createFortuneWheelChild(-50),
                _createFortuneWheelChild(-500),
                _createFortuneWheelChild(-100),
                _createFortuneWheelChild(-200),
              ],
            ),
          ),
          verticalHeight32,
          MyButton(
            onTap: () => wheelCtrl.rotateWheel(),
            label: 'Play',
          ),
        ],
      ),
    );
  }

  WheelModel<int> _createFortuneWheelChild(int value) {
    Color color = value.isNegative ? Colors.red : Colors.green;
    String verb = value.isNegative ? 'Lose' : 'Win';
    int valueString = value.abs();

    return WheelModel(
        foreground: _getWheelContentCircle(color, '$verb\n$valueString €'),
        value: value);
  }

  Container _getWheelContentCircle(Color backgroundColor, String text) {
    return Container(
      width: 72,
      height: 72,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 4)),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: myText(
            text,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
