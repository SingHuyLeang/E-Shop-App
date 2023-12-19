import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.icon,
    this.radius,
    this.height,
    this.fontColor,
    this.fontSize,
    this.alignment, this.border,
  });
  final void Function()? onTap;
  final String text;
  final Widget? icon;
  final Color? color;
  final Color? fontColor;
  final double? radius;
  final double? height;
  final double? fontSize;
  final Alignment? alignment;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 60,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 26),
        ),
        child: icon == null
            ? AppText(
                text: text,
                color: fontColor ?? AppColor.darktext,
                textAlign: TextAlign.center,
                fontSize: getFontSize(width: fontSize ?? 20),
              )
            : Row(
                children: [
                  AppText(
                    text: text,
                    color: fontColor ?? AppColor.darktext,
                    fontSize: getFontSize(width: fontSize ?? 20),
                  ),
                ],
              ),
      ),
    );
  }
}
