import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustoomHeader extends StatelessWidget {
  const CustoomHeader({
    super.key,
    required this.titleHeader,
    required this.subTitleHeader,
    this.titleAlign,
    this.subTitleAlign,
    this.crossAxisAlignment,
  });
  final String titleHeader, subTitleHeader;
  final TextAlign? titleAlign, subTitleAlign;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Gap(SizeConfig.screenHeight * 0.01),
        AppText(
          text: titleHeader,
          fontSize: getFontSize(width: 40),
          color: AppColor.lightText,
          fontWeight: FontWeight.bold,
          textAlign: titleAlign,
        ),
        Gap(getProportionateScreenHeight(height: 10)),
        AppText(
          text: subTitleHeader,
          textAlign: subTitleAlign ?? TextAlign.center,
          fontSize: getFontSize(width: 16),
        ),
      ],
    );
  }
}
