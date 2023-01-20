import '../../lib_exp.dart';

class MyCheckBox extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onChecked;
  final bool value;
  const MyCheckBox({
    required this.label,
    required this.onChecked,
    required this.value ,
    super.key,
  });

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  late bool _isCheck;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isCheck = widget.value;
    return Clickable(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        setState(() => _isCheck = !_isCheck);
        widget.onChecked(_isCheck);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              activeColor: fourtharyColor,
              value: _isCheck,
              onChanged: (value) => setState(() {
                _isCheck = value!;
                widget.onChecked(_isCheck);
              }),
            ),
          ),
          // horizontalWidth4,
          myText(
            widget.label,
            fontSize: 14,
            color: fourtharyColor,
          ),
        ],
      ),
    );
  }
}
