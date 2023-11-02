import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.text,
      {this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.overflow,
      this.textDecoration,
      this.textAlign,
      Key? key})
      : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: textDecoration));
  }
}
