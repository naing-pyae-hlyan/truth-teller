import '../../lib_exp.dart';

class MyGradientButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  final List<Color> gradientColors;
  final Color? labelColor;
  final EdgeInsets padding;
  final double? width;
  final BorderRadius? borderRadius;
  const MyGradientButton({
    required this.label,
    this.gradientColors = const <Color>[
      primaryColor,
      thirdaryColor,
      fourtharyColor,
      fivearyColor,
    ],
    this.labelColor,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.borderRadius,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            tileMode: TileMode.mirror,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(32),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(32),
            ),
          ),
          child: myText(
            label,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: labelColor ?? Colors.grey,
          ),
        ),
      ),
    );
  }
}
