import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ListOfHistory extends StatelessWidget {
  ListOfHistory({super.key});

  final SearchHistory controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: AppText(
                text: 'Clear all',
                fontSize: getFontSize(width: 16),
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),
                onTap: () async {
                  controller.clear();
                },
              ),
            ),
            Gap(getProportionateScreenWidht(width: 10)),
            Column(
              children: List.generate(
                controller.history.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                    bottom: getProportionateScreenHeight(height: 8),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      searchController.text = controller.history[index];
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 9,
                          child: AppText(
                            text: controller.history[index],
                            fontSize: getFontSize(width: 18),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () async {
                              controller.remove(controller.history[index]);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/svg/cross.svg',
                              width: getProportionateScreenWidht(
                                width: 15,
                              ),
                              height: getProportionateScreenHeight(
                                height: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
