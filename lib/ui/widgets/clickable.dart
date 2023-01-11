import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Widget child;

  const Clickable({
    Key? key,
    required this.onTap,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
