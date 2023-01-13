import '../../lib_exp.dart';

class InputFormWithButton extends StatefulWidget {
  final String hintText;
  final String btnLabel;
  final ValueChanged<String> onPressed;
  const InputFormWithButton({
    required this.hintText,
    this.btnLabel = 'Add',
    required this.onPressed,
    super.key,
  });

  @override
  State<InputFormWithButton> createState() => _InputFormWithButtonState();
}

class _InputFormWithButtonState extends State<InputFormWithButton> {
  final _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: context.screenWidth * 0.7 - 24,
            child: CommonInputWidget(
              editingController: _editingController,
              hintText: widget.hintText,
              useOutlineInputBorder: true,
            ),
          ),
          MyButton(
            onTap: () {
              final text = _editingController.text;
              if (text.isNotEmpty) {
                widget.onPressed(text);
                _editingController.clear();
              }
            },
            label: widget.btnLabel,
            width: context.screenWidth * 0.25 - 24,
            borderRadius: BorderRadius.circular(8),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
          ),
        ],
      ),
    );
  }
}
