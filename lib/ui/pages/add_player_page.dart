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
  Future<void> _checkPlayerListAndPlay() async {
    final int length = HiveHelper.boxUser().length;
    if (length > minPlayers && length < maxPlayers) {
      context.pushReplacement(LevelUpPage(
        playMode: widget.playMode,
        userList: [],
      ));
    } else {
      showToast(
        'Player မှာ အနည်းဆုံး ၂ယောက်မှ အများဆုံး ၅၀ယောက်ထိသာ ကစားနိုင်ပါသည်။',
      );
    }
  }

  Future<void> _addUser(String name) async =>
      HiveHelper.addUser(UserModel(playerName: name));

  Future<void> _deleteData(int? idKey) async {
    if (idKey == null) return;
    HiveHelper.deleteUser(idKey);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: MyImageScaffold(
        extendBodyBehindAppBar: true,
        appBar: myAppBar(context, addCloseButton: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InputFormWithButton(
              hintText: 'ကစားမည့်အမည်ထည့်ပါ',
              onPressed: (String name) => _addUser(name),
            ),
            verticalHeight24,
            _userListViewBuilder,
            playButton(
              context,
              onTap: () => _checkPlayerListAndPlay(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _userListViewBuilder => ValueListenableBuilder(
        valueListenable: HiveHelper.boxUser().listenable(),
        builder: (_, Box<UserModel> items, __) {
          final List<int> keys = items.keys.cast<int>().toList();
          final List<UserModel?> values =
              items.values.cast<UserModel>().toList();

          return Expanded(
            child: RawScrollbar(
              thumbColor: primaryColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: values.length,
                itemBuilder: (_, index) {
                  if (values[index] == null) return emptyUI;

                  return MyListTile(
                    userModel: values[index],
                    leading: Icon(
                      _icon,
                      color: primaryColor,
                    ),
                    onRemove: () => _deleteData(keys[index]),
                  );
                },
              ),
            ),
          );
        },
      );

  IconData get _icon {
    if (widget.playMode == PlayMode.alcholic) {
      return Icons.liquor;
    } else {
      return Icons.group_add;
    }
  }
}
