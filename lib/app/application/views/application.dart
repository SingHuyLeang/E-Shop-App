import 'package:e_store_app/app/application/services/list_screen.dart';
import 'package:e_store_app/app/application/services/screen_helper.dart';
import 'package:e_store_app/app/application/views_model/app_bottom_nav_bar.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final controller = Get.put(ScreenApplication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: screens.length,
          onPageChanged: (value) {
            setState(() {
              controller.setScreenIndex(index: value);
            });
          },
          itemBuilder: (context, cindex) => screens[controller.getIndex()],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(height: 60),
        margin: EdgeInsets.all(getProportionateScreenWidht(width: 16)),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(22),
        ),
        child: AppBottomNavBar(
          index: controller.getIndex(),
          onTap: (index) {
            setState(() {
              controller.setScreenIndex(index: index);
            });
          },
        ),
      ),
    );
  }
}
