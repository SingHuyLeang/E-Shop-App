import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SocailMedia extends StatelessWidget {
  const SocailMedia({
    super.key,
    this.facebookAccount,
    this.googleAccount,
    this.appleAccount,
  });
  final void Function()? facebookAccount;
  final void Function()? googleAccount;
  final void Function()? appleAccount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(height: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // google
          GestureDetector(
            onTap: googleAccount,
            child: Container(
              width: getProportionateScreenWidht(width: 50),
              height: getProportionateScreenHeight(height: 50),
              decoration: BoxDecoration(
                color: AppColor.lightPrimary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidht(width: 12)),
                child: SvgPicture.asset('assets/icons/svg/google.svg'),
              ),
            ),
          ),
          Gap(getProportionateScreenWidht(width: 10)),
          // facebook
          GestureDetector(
            onTap: googleAccount,
            child: Container(
              width: getProportionateScreenWidht(width: 50),
              height: getProportionateScreenHeight(height: 50),
              decoration: BoxDecoration(
                color: AppColor.lightPrimary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidht(width: 12)),
                child: SvgPicture.asset('assets/icons/svg/facebook.svg'),
              ),
            ),
          ),
          Gap(getProportionateScreenWidht(width: 10)),
          // apple
          GestureDetector(
            onTap: googleAccount,
            child: Container(
              width: getProportionateScreenWidht(width: 50),
              height: getProportionateScreenHeight(height: 50),
              decoration: BoxDecoration(
                color: AppColor.lightPrimary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidht(width: 12)),
                child: SvgPicture.asset('assets/icons/svg/apple.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
