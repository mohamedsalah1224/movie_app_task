import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? wordCount;
  const CustomText(
      {super.key,
      required this.text,
      this.alignment,
      this.color,
      this.fontSize,
      this.wordCount,
      this.maxLines = 4,
      this.textAlign,
      this.fontFamily,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
          wordCount == null
              ? text
              : text.length < wordCount!
                  ? text
                  : "${text.substring(0, wordCount! - 3)}...",
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight)),
    );
  }
}
