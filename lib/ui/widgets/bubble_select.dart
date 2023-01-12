import '../../lib_exp.dart';

class BubbleSelect extends StatelessWidget {
  final PlayModeModel data;
  final Function() onTap;
  const BubbleSelect({
    required this.data,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: parsePlayModeToColor(data.mode.index)),
          borderRadius: BorderRadius.circular(32),
          color: data.selected ? parsePlayModeToColor(data.mode.index) : Colors.white,
        ),
        child: myText(
          parsePlayModeLabel(data.mode),
          color: data.selected ? Colors.white : parsePlayModeToColor(data.mode.index),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
