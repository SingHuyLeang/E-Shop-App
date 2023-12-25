import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.pageController,
    required this.count,
  });
  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidht(width: 150),
      height: getProportionateScreenHeight(height: 8),
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: pageController,
        count: count,
        axisDirection: Axis.horizontal,
        effect: ExpandingDotsEffect(
          activeDotColor: AppColor.mainColor,
          dotColor: Theme.of(context).colorScheme.primary,
          dotWidth: getProportionateScreenWidht(width: 8),
          dotHeight: getProportionateScreenHeight(height: 8),
          spacing: getProportionateScreenWidht(width: 3.2),
        ),
      ),
    );
  }
}
