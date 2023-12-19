import 'package:e_store_app/app/application/services/screen_helper.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ScreenApplication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 4,
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  controller.setScreenIndex(index: 4);
                });
              },
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidht(width: 14)),
                child: SvgPicture.asset(
                  'assets/icons/svg/leading.svg',
                  width: getProportionateScreenWidht(width: 23),
                  height: getProportionateScreenHeight(height: 23),
                ),
              ),
            ),
            title: AppText(
              text: 'E-Shop',
              font: FontName.outfit,
              fontSize: getFontSize(width: 24),
              color: AppColor.lightText,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          for (int i = 0; i < 10; i++)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: AppColor.subColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
