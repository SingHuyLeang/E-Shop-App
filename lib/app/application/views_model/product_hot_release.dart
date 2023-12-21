import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductHotRelease extends StatelessWidget {
  const ProductHotRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  fontSize: getFontSize(width: 20),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                AppText(
                  text: 'See more',
                  fontSize: getFontSize(width: 14),
                  color: Theme.of(context).colorScheme.onSecondary,
                )
              ],
            ),
          ),
          Gap(getProportionateScreenHeight(height: 5)),
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(height: 300),
            child: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                children: [
                  ViewNetworkImage(
                    url:
                        'https://img.freepik.com/free-vector/realistic-ad-template-natural-cream_23-2148255735.jpg?w=1060&t=st=1703043542~exp=1703044142~hmac=ffdbd44d95bb858d6b3e986dd6842bd89845f0d7892eb6451a7521533b391e3d',
                    width: double.infinity,
                    height: getProportionateScreenHeight(height: 220),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidht(width: 6),
                      vertical: getProportionateScreenHeight(height: 8),
                    ),
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidht(width: 16),
                    ),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(height: 60),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidht(width: 16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidht(width: 8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800.withOpacity(0.1),
                          offset: Offset(0.0, 0.6),
                          blurRadius: getProportionateScreenHeight(height: 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Title',
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: getFontSize(width: 22),
                        ),
                        AppText(
                          text: 'Sub Title',
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: getFontSize(width: 16),
                        ),
                      ],
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
