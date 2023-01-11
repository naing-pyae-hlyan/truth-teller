import '../../lib_exp.dart';

class ClickableText extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final TextStyle? textStyle;
  final Color color;

  const ClickableText(
    this.label, {
    this.textStyle,
    required this.onTap,
    this.color = fivearyColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Text(
        label,
        style: textStyle ?? TextStyle(color: color),
      ),
    );
  }
}

Text myText(
  String text, {
  Color? color,
  double fontSize = 12,
  FontWeight? fontWeight,
  int maxLine = 4,
  TextAlign? textAlign,
}) =>
    Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? fivearyColor,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      softWrap: true,
      textScaleFactor: 1.0,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
