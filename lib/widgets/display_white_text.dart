import 'package:flutter/material.dart';
import 'package:riverpod_todo/utils/utils.dart';

class DisplayWhiteText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DisplayWhiteText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: context.colorScheme.surface,
      ),
    );
  }
}
