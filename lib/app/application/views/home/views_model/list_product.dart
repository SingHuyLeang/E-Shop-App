import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final controller = Get.put(ProductSevice());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductSevice>(
      init: controller,
      builder: (products) => SliverList.builder(
        itemCount: products.product.length,
        itemBuilder: (context, index) {
          final product = products.product;
          return Padding(
            padding: EdgeInsets.all(getProportionateScreenWidht(width: 8)),
            child: Column(
              children: [
                ViewNetworkImage(
                  url: product[index].image,
                  width: double.infinity,
                  height: getProportionateScreenHeight(height: 260),
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidht(width: 5),
                  ),
                  fit: BoxFit.cover,
                ),
                Gap(getProportionateScreenHeight(height: 10)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: getProportionateScreenHeight(height: 115),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: product[index].name,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: getFontSize(width: 22),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            actions(
                              context: context,
                              onTapFavorite: () {
                                setState(() {
                                  product[index].favorite =
                                      !product[index].favorite;
                                });
                              },
                              onTapComment: () {},
                              favorite: product[index].favorite,
                            ),
                          ],
                        ),
                        Gap(getProportionateScreenHeight(height: 10)),
                        AppText(
                          text: product[index].descrpition,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: getFontSize(width: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap(getProportionateScreenHeight(height: 8)),
                        product[index].discount == 0
                            ? AppText(
                                text: '\$ ${product[index].price}',
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: getFontSize(width: 20),
                              )
                            : Row(
                                children: [
                                  AppText(
                                    text: '\$ ${product[index].price}',
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: getFontSize(width: 20),
                                    textDirection: TextDecoration.lineThrough,
                                    decorationColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    decorationThickness: getFontSize(width: 2),
                                  ),
                                  Gap(getProportionateScreenWidht(width: 5)),
                                  AppText(
                                    text:
                                        '\$ ${product[index].price - (product[index].price * product[index].discount) / 100}',
                                    color: AppColor.mainColor,
                                    fontSize: getFontSize(width: 20),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
                Gap(getProportionateScreenHeight(height: 10)),
              ],
            ),
          );
        },
      ),
    );
  }
}
