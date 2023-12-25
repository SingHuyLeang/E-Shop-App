import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(getProportionateScreenWidht(width: 8)),
        child: Container(
          width: double.infinity,
          height: getProportionateScreenHeight(height: 200),
          decoration: BoxDecoration(
            color: AppColor.subColor,
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidht(width: 8),
            ),
          ),
        ),
      ),
    );
  }
}
