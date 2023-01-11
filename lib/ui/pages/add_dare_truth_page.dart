import '../../lib_exp.dart';

class AddDareTruthPage extends StatefulWidget {
  final bool isDare;
  const AddDareTruthPage({
    required this.isDare,
    super.key,
  });

  @override
  State<AddDareTruthPage> createState() => _AddDareTruthPageState();
}

class _AddDareTruthPageState extends State<AddDareTruthPage> {
  final _editingController = TextEditingController();

  Future<void> _addData() async {
    final text = _editingController.text;
    if (text.isEmpty) return;
    HiveHelper.put(
      DataModel(text: text),
      isDare: widget.isDare,
    );
  }

  Future<void> _deleteData(int? idKey) async {
    if (idKey == null) return;
    HiveHelper.delete(idKey, isDare: widget.isDare);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: MyImageScaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: myText(
            widget.isDare ? 'Add Dares' : 'Add Truths',
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _inputFormWithAddButton,
            _listViewBuilder,
            _backButton,
          ],
        ),
      ),
    );
  }

  Widget get _inputFormWithAddButton => Container(
        // color: secondaryColor,
        margin: const EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: context.screenWidth * 0.7 - 24,
              child: CommonInputWidget(
                editingController: _editingController,
                hintText: widget.isDare
                    ? 'Enter your dare here'
                    : 'Enter your truths here',
                useOutlineInputBorder: true,
              ),
            ),
            MyButton(
              onTap: () => _addData(),
              label: 'Add',
              width: context.screenWidth * 0.25 - 24,
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 8),
            ),
          ],
        ),
      );

  Widget get _listViewBuilder => ValueListenableBuilder(
        valueListenable: HiveHelper.box(widget.isDare).listenable(),
        builder: (_, Box<DataModel> items, __) {
          List<int> keys = items.keys.cast<int>().toList();
          return Expanded(
            child: RawScrollbar(
              thumbColor: primaryColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: keys.length,
                itemBuilder: (_, index) {
                  final DataModel? data = items.get(keys[index]);
                  if (data == null) return emptyUI;
                  return Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: ListTile(
                      title:
                          myText(data.text, color: primaryColor, maxLine: 10),
                      trailing: Clickable(
                        onTap: () => _deleteData(keys[index]),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: primaryColor,
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: secondaryColor.withOpacity(0.1),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );

  Widget get _backButton => MyButton(
        onTap: () => context.pop(),
        label: 'Back To Home',
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 18,
        ),
        width: context.screenWidth * 0.7 - 24,
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.all(16),
      );
}
