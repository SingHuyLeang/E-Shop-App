import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SpecialDayProduct extends StatelessWidget {
  SpecialDayProduct({super.key});

  final productController = Get.put(ProductSevice());

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidht(width: 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Special Day',
                    fontSize: getFontSize(width: 24),
                  ),
                  AppText(
                    text: 'See more',
                    fontSize: getFontSize(width: 16),
                    color: AppColor.darkSecondary,
                  )
                ],
              ),
            ),
            Gap(getProportionateScreenHeight(height: 16)),
            CarouselSlider(
              items: List.generate(
                productController.spacialDay.length > 5
                    ? 5
                    : productController.spacialDay.length,
                (index) => ViewNetworkImage(
                  url: productController.spacialDay[index].image,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidht(width: 16),
                  ),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              options: CarouselOptions(
                height: getProportionateScreenHeight(height: 170),
                aspectRatio: 16 / 9,
                viewportFraction: 0.87,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Gap(getProportionateScreenHeight(height: 15)),
          ],
        ),
      ),
    );
  }
}
