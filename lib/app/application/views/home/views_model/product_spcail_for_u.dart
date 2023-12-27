import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SpecailForYou extends StatefulWidget {
  const SpecailForYou({super.key});
  @override
  State<SpecailForYou> createState() => _SpecailForYouState();
}

class _SpecailForYouState extends State<SpecailForYou> {
  final productController = Get.put(ProductSevice());
  final pageController = PageController(viewportFraction: 1, keepPage: false);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final product = productController.spacialDay;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(height: 5),
        ),
        color: Theme.of(context).colorScheme.background,
        height: getProportionateScreenHeight(height: 405),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidht(width: 16),
                vertical: getProportionateScreenHeight(height: 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Special for you',
                    fontSize: getFontSize(width: 24),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  AppText(
                    text: 'See more',
                    fontSize: getFontSize(width: 16),
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                ],
              ),
            ),
            Gap(getProportionateScreenHeight(height: 5)),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(height: 260),
              child: PageView.builder(
                itemCount: product.length > 5 ? 5 : product.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, pIndex) => ViewNetworkImage(
                  url: product[index].image,
                  width: double.infinity,
                  height: getProportionateScreenHeight(height: 210),
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidht(width: 10),
                    vertical: getProportionateScreenHeight(height: 8),
                  ),
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidht(width: 8),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Indicator(
              pageController: pageController,
              count: product.length > 5 ? 5 : product.length,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidht(width: 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: product[index].name,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: getFontSize(width: 22),
                        ),
                        Gap(getProportionateScreenHeight(height: 10)),
                        AppText(
                          text: product[index].descrpition,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: getFontSize(width: 18),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: actions(
                      context: context,
                      onTapFavorite: () {
                        setState(() {
                          product[index].favorite = !product[index].favorite;
                        });
                      },
                      onTapComment: () {},
                      favorite: product[index].favorite,
                    ),
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
