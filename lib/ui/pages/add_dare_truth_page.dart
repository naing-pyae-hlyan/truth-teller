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
  late BubbleSelectCtrl _checkBoxCtrl;

  Future<void> _addData(String text) async => HiveHelper.addDareOrTruth(
        DataModel(
          text: text,
          modes: _checkBoxCtrl.getModes(),
        ),
        isDare: widget.isDare,
      );

  Future<void> _deleteData(int? idKey) async {
    if (idKey == null) return;
    HiveHelper.deleteDareOrTruth(idKey, isDare: widget.isDare);
  }

  @override
  void initState() {
    _checkBoxCtrl = context.read<BubbleSelectCtrl>();
    _checkBoxCtrl.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: MyImageScaffold(
        extendBodyBehindAppBar: true,
        appBar: myAppBar(
          context,
          title: widget.isDare ? 'Add Dares' : 'Add Truths',
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InputFormWithButton(
              hintText: widget.isDare
                  ? 'Enter your dares here'
                  : 'Enter your truths here',
              onPressed: (String str) => _addData(str),
            ),
            verticalHeight24,
            _checkBoxGroup,
            _listViewBuilder,
            backToHomeButton(context),
          ],
        ),
      ),
    );
  }

  Widget get _checkBoxGroup => Consumer<BubbleSelectCtrl>(
        builder: (_, ctrl, __) {
          final List<PlayModeModel> list = ctrl.checkList;
          return Wrap(
            children: List.generate(
              list.length,
              (index) => BubbleSelect(
                data: list[index],
                onTap: () => ctrl.onSelect(list[index].mode),
              ),
            ),
          );
        },
      );

  Widget get _listViewBuilder => ValueListenableBuilder(
        valueListenable: HiveHelper.boxDareOrTruth(widget.isDare).listenable(),
        builder: (_, Box<DataModel> items, __) {
          final List<int> keys = items.keys.cast<int>().toList();
          final List<DataModel> values =
              items.values.cast<DataModel>().toList();

          return Consumer<BubbleSelectCtrl>(builder: (context, checkCtrl, __) {
            final List<int> modeIndexs = checkCtrl.getModes();
            final List<DataModel?> list = [];

            for (DataModel dm in values) {
              final List<int> i = dm.modes
                  .where((element) => modeIndexs.contains(element))
                  .toList();
              if (i.isNotEmpty) {
                list.add(dm);
              }
            }

            return Expanded(
              child: RawScrollbar(
                thumbColor: primaryColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    if (list[index] == null) return emptyUI;
                    return MyListTile(
                      dataModel: list[index],
                      onRemove: () => _deleteData(keys[index]),
                    );
                  },
                ),
              ),
            );
          });
        },
      );
}
