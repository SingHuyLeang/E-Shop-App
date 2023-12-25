// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';

class AllProduct extends StatelessWidget {
  const AllProduct(
      {super.key, this.onTapList, this.onTapGrid, required this.listView});

  final void Function()? onTapList;
  final void Function()? onTapGrid;

  final bool listView;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidht(width: 16),
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Gap(getProportionateScreenHeight(height: 20)),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'All Product',
                    fontSize: getFontSize(width: 24),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onTapList,
                        child: SvgPicture.asset(
                          'assets/icons/svg/list.svg',
                          height: getProportionateScreenHeight(height: 26),
                          width: getProportionateScreenWidht(width: 26),
                          color: listView
                              ? AppColor.mainColor
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Gap(getProportionateScreenWidht(width: 15)),
                      GestureDetector(
                        onTap: onTapGrid,
                        child: SvgPicture.asset(
                          'assets/icons/svg/grid.svg',
                          height: getProportionateScreenHeight(height: 18),
                          width: getProportionateScreenWidht(width: 18),
                          color: listView
                              ? Theme.of(context).colorScheme.onSecondary
                              : AppColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
