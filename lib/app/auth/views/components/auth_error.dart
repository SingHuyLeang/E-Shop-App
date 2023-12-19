import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';

class AuthError extends StatelessWidget {
  const AuthError({super.key, required this.errors});
  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: getProportionateScreenWidht(width: 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          errors.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(height: 5),
            ),
            child: AppText(
              text: errors[index],
              fontSize: getFontSize(width: 16),
              color: AppColor.warning,
            ),
          ),
        ),
      ),
    );
  }
}
