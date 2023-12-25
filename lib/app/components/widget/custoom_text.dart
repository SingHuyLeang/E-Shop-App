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
    this.overflow = TextOverflow.fade,
    this.maxLines,
    this.onTap,
    this.shadows,
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
  final List<Shadow>? shadows;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: font ?? FontName.barlow,
          fontSize: fontSize,
          color: color ?? Theme.of(context).colorScheme.onPrimary,
          shadows: shadows,
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
