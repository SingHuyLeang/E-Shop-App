import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/routes/export.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(text: 'Create new account ?', fontSize: 16),
        Gap(getProportionateScreenWidht(width: 5)),
        SizedBox(
          width: getProportionateScreenWidht(width: 60),
          child: AppButton(
            onTap: () {
              Get.toNamed(RoutesName.signUp);
            },
            text: 'Register',
            fontColor: AppColor.mainColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
