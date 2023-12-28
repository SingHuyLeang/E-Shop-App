import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    required this.controller,
    this.radius,
    this.hintText,
    this.label,
    this.hasError,
    this.suffixIcons,
    this.icon,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.style,
    this.borderColor,
    this.textAlign,
    this.inputFormatters,
    this.floatingLabelBehavior,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final double? radius;
  final String? hintText;
  final String? label;
  final bool? hasError;
  final Widget? suffixIcons;
  final String? icon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final Color? borderColor;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    Color? color = (borderColor != null)
        ? borderColor
        : (hasError == true)
            ? AppColor.warning
            : AppColor.darkBG;
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      style: style,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.always,
        suffixIcon: suffixIcons,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(color: color ?? AppColor.darkBG),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          borderSide: BorderSide(
            color: color ?? Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        hintStyle: TextStyle(
          fontFamily: FontName.barlow,
          fontSize: getFontSize(width: 18),
          color: Colors.grey[700],
        ),
        label: AppText(
          text: label ?? '',
          fontSize: getFontSize(width: 18),
          color: AppColor.lightText,
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
