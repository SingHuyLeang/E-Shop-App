import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custoom_text.dart';

Future<void> showSnackBar({String? title, String? subTitle}) async {
  await Get.showSnackbar(
    GetSnackBar(
      duration: Duration(milliseconds: 3000),
      animationDuration: Duration(milliseconds: 2000),
      borderRadius: getProportionateScreenWidht(width: 16),
      reverseAnimationCurve: Curves.bounceIn,
      padding: EdgeInsets.all(getProportionateScreenWidht(width: 20)),
      maxWidth: double.infinity,
      titleText: AppText(
        text: title ?? '',
        fontSize: getFontSize(width: 18),
        color: AppColor.lightText,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
      ),
      messageText: AppText(
        text: subTitle ?? '',
        fontSize: getFontSize(width: 16),
        color: AppColor.lightText,
        textAlign: TextAlign.center,
        softWrap: true,
      ),
      backgroundColor: AppColor.lightBG,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(getProportionateScreenWidht(width: 20)),
      borderColor: Colors.grey[300],
    ),
  );
}
