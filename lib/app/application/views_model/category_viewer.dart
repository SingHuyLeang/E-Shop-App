import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryViewer extends StatelessWidget {
  const CategoryViewer({super.key, required this.category});

  final List<Map<String, dynamic>> category;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(height: 20),
          bottom: getProportionateScreenHeight(height: 10),
        ),
        padding: EdgeInsets.only(
          left: getProportionateScreenWidht(width: 5),
        ),
        width: double.infinity,
        height: getProportionateScreenHeight(height: 100),
        child: ListView.builder(
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            width: getProportionateScreenWidht(width: 50),
            height: getProportionateScreenHeight(height: 60),
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidht(width: 10),
            ),
            child: Column(
              children: [
                Container(
                  width: getProportionateScreenWidht(width: 50),
                  height: getProportionateScreenHeight(height: 50),
                  padding: EdgeInsets.all(
                    getProportionateScreenHeight(height: 14),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidht(width: 16),
                    ),
                  ),
                  child: SvgPicture.asset(category[index]['icon']),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidht(width: 4),
                  ),
                  child: AppText(
                    text: category[index]['title'],
                    softWrap: true,
                    maxLines: 2,
                    fontSize: getFontSize(width: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
