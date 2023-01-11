import '../../lib_exp.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? labelColor;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final String label;
  final FontWeight? labelFontWeight;
  final double? fontSize;
  final double elevation;
  final bool alignAllCenter;
  final BorderSide? borderSide;

  const MyButton({
    Key? key,
    required this.onTap,
    this.color,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.leading,
    required this.label,
    this.fontSize,
    this.labelColor,
    this.borderSide,
    this.elevation = 4,
    this.labelFontWeight = FontWeight.bold,
    this.alignAllCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: color ?? thirdaryColor,
          shadowColor: thirdaryColor.withOpacity(0.4),
          padding: kIsWeb
              ? padding?.copyWith(
                  top: (padding?.top ?? 0) + 8,
                  bottom: (padding?.bottom ?? 0) + 8,
                )
              : padding,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(50),
            side: borderSide ??
                const BorderSide(
                  color: Colors.white,
                ),
          ),
        ),
        child: _body,
      ),
    );
  }

  Widget get _body => Container(
        alignment: Alignment.center,
        child: _label,
      );

  Widget get _label => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? const SizedBox.shrink(),
          (alignAllCenter)
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: _labelText,
                )
              : Expanded(
                  child: Center(
                    child: _labelText,
                  ),
                ),
        ],
      );

  Widget get _labelText => Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: labelFontWeight,
          color: labelColor ?? Colors.white,
        ),
      );
}
