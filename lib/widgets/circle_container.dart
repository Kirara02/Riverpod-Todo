import 'package:flutter/cupertino.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.color,
    this.child,
    this.borderColor,
    this.borderWidth,
  });
  final Color color;
  final Widget? child;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: borderWidth ?? 2,
          color: color,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
