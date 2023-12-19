import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/application/services/screen_helper.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ScreenApplication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
                  fontSize: getFontSize(width: 26),
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
          ),
          SliverToBoxAdapter(
            child: CategoryViewer(
              title: 'Title subtitle',
              icon: 'assets/icons/svg/notification.svg',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: getProportionateScreenHeight(height: 210),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      getProportionateScreenWidht(width: 8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: 'Special Day',
                          fontSize: getFontSize(width: 16),
                        ),
                        AppText(
                          text: 'See more',
                          fontSize: getFontSize(width: 12),
                          color: AppColor.darkSecondary,
                        )
                      ],
                    ),
                  ),
                  CarouselSlider(
                    items: List.generate(
                      5,
                      (index) => Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(height: 150),
                        color: AppColor.warning,
                      ),
                    ),
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
