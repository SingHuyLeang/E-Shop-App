import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget custoomSuffixIcons(String icon,
        {void Function()? onTap, double? padding}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0,
          getProportionateScreenWidht(width: padding ?? 10),
          getProportionateScreenWidht(width: padding ?? 10),
          getProportionateScreenWidht(width: padding ?? 10),
        ),
        child: LottieBuilder.asset(
          icon,
          height: getProportionateScreenHeight(height: 20),
          repeat: false,
        ),
      ),
    );
