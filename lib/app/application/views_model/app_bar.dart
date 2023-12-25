import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/icons/logo-app.png',
            width: getProportionateScreenWidht(width: 55),
            height: getProportionateScreenHeight(height: 55),
          ),
          AppText(
            text: 'E-Shop',
            font: FontName.outfit,
            fontSize: getFontSize(width: 28),
            color: AppColor.lightText,
          ),
        ],
      ),
      actions: [
        Gap(getProportionateScreenWidht(width: 15)),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/svg/shopping-cart.svg',
            width: getProportionateScreenWidht(width: 28),
            height: getProportionateScreenHeight(height: 28),
          ),
        ),
        Gap(getProportionateScreenWidht(width: 15)),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/svg/chat.svg',
            width: getProportionateScreenWidht(width: 25),
            height: getProportionateScreenHeight(height: 25),
          ),
        ),
        Gap(getProportionateScreenWidht(width: 15)),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
