import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CategoryViewer extends StatelessWidget {
  const CategoryViewer({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                height: getProportionateScreenHeight(height: 55),
                padding: EdgeInsets.all(
                  getProportionateScreenHeight(height: 14),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.mainColor),
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidht(width: 16),
                  ),
                ),
                child: SvgPicture.asset(icon),
              ),
              Gap(getProportionateScreenHeight(height: 5)),
              AppText(
                text: title,
                softWrap: true,
                maxLines: 2,
                fontSize: getFontSize(width: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
