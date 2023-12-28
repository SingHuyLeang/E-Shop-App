import 'package:e_store_app/app/application/views/search/model/list_history.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required this.searchController});
  final TextEditingController searchController;
  final controller = Get.put(SearchHistory());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      height: getProportionateScreenHeight(height: 80),
      child: buildSearchField(),
    );
  }

  AppTextFiled buildSearchField() {
    return AppTextFiled(
      keyboardType: TextInputType.text,
      controller: searchController,
      hintText: 'Search anything...',
      radius: getProportionateScreenWidht(width: 26),
      suffixIcons: GestureDetector(
        onTap: () async {
          if (searchController.text.isNotEmpty &&
              !controller.find(searchController.text)) {
            controller.add(searchController.text);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/svg/search.svg',
            // ignore: deprecated_member_use
            color: AppColor.mainColor,
          ),
        ),
      ),
      onFieldSubmitted: (value) async {
        if (value.isNotEmpty && !controller.find(value)) {
          controller.add(value);
        }
      },
    );
  }
}
