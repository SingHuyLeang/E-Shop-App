import 'package:e_store_app/public/font_name.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.font,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.onTap,
  }) : super(key: key);
  final String text;
  final String? font;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: font ?? FontName.barlow,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
