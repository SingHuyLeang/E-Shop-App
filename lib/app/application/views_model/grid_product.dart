import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Container(
        width: double.infinity / 2,
        height: getProportionateScreenHeight(height: 300),
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidht(width: 8),
          ),
        ),
      ),
    );
  }
}
