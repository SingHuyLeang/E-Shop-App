import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductHotRelease extends StatefulWidget {
  const ProductHotRelease({super.key});

  @override
  State<ProductHotRelease> createState() => _ProductHotReleaseState();
}

class _ProductHotReleaseState extends State<ProductHotRelease> {
  bool favorite = false;
  final pageController = PageController(viewportFraction: 1, keepPage: false);
  final productController = Get.put(ProductSevice());
  int index = 0;
  @override
  Widget build(BuildContext context) {
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
                    text: 'New Product',
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
                itemCount: productController.newProduct.length > 5
                    ? 5
                    : productController.newProduct.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, pIndex) => ViewNetworkImage(
                  url: productController.newProduct[index].image,
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
              count: productController.newProduct.length > 5
                  ? 5
                  : productController.newProduct.length,
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
                          text: productController.newProduct[index].name,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: getFontSize(width: 22),
                        ),
                        AppText(
                          text: productController.newProduct[index].descrpition,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: getFontSize(width: 18),
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
                          favorite = !favorite;
                        });
                      },
                      onTapComment: () {},
                      favorite: favorite,
                    ),
                  ),
                ],
              ),
            ),
            Gap(getProportionateScreenHeight(height: 15)),
          ],
        ),
      ),
    );
  }
}
