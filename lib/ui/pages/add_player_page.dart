import '../../lib_exp.dart';

class AddPlayerPage extends StatefulWidget {
  final PlayMode playMode;
  const AddPlayerPage({
    required this.playMode,
    super.key,
  });

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return MyImageScaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBar(context, addCloseButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InputFormWithButton(
            hintText: 'ကစားမည့်အမည်ထည့်ပါ',
            onPressed: (String str) {},
          ),
        ],
      ),
    );
  }
}
