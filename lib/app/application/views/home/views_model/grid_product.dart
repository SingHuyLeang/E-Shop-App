import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GridProduct extends StatefulWidget {
  const GridProduct({super.key});

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  final productController = Get.put(ProductSevice());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: productController,
        builder: (products) {
          return SliverPadding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(height: 7),
              left: getProportionateScreenWidht(width: 8),
              right: getProportionateScreenWidht(width: 8),
            ),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.55,
              ),
              itemCount: products.product.length,
              itemBuilder: (context, index) =>
                  buildContainer(products.product[index]),
            ),
          );
        });
  }

  Padding buildContainer(ProductModel product) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ViewNetworkImage(
              url: product.image,
              width: double.infinity,
              height: getProportionateScreenHeight(height: 200),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidht(width: 5),
              ),
              fit: BoxFit.cover,
            ),
          ),
          Gap(getProportionateScreenHeight(height: 8)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: AppText(
                        text: product.name,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: getFontSize(width: 20),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        child: actions(
                          context: context,
                          onTapFavorite: () {
                            setState(() {
                              product.favorite = !product.favorite;
                            });
                          },
                          onTapComment: () {},
                          favorite: product.favorite,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(getProportionateScreenHeight(height: 5)),
                AppText(
                  text: product.descrpition,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: getFontSize(width: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(getProportionateScreenHeight(height: 3)),
                product.discount == 0
                    ? AppText(
                        text: '\$ ${product.price}',
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: getFontSize(width: 18),
                      )
                    : Row(
                        children: [
                          AppText(
                            text: '\$ ${product.price}',
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: getFontSize(width: 18),
                            textDirection: TextDecoration.lineThrough,
                            decorationColor:
                                Theme.of(context).colorScheme.onPrimary,
                            decorationThickness: getFontSize(width: 2),
                          ),
                          Gap(getProportionateScreenWidht(width: 5)),
                          AppText(
                            text:
                                '\$ ${product.price - (product.price * product.discount) / 100}',
                            color: AppColor.mainColor,
                            fontSize: getFontSize(width: 18),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
