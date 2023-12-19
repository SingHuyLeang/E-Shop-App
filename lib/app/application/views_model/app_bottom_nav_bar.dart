// ignore_for_file: deprecated_member_use

import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.index, this.onTap});
  final int index;
  final void Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      enableFeedback: false,
      unselectedItemColor: Colors.grey[700],
      selectedItemColor: AppColor.mainColor,
      selectedLabelStyle: TextStyle(
        fontSize: getFontSize(width: 12),
        fontFamily: FontName.barlow,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: getFontSize(width: 12),
        fontFamily: FontName.barlow,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: onTap,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/home.svg',
            color: Colors.grey[700],
          ),
          activeIcon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/home1.svg',
            color: AppColor.mainColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/search.svg',
            color: Colors.grey[700],
          ),
          activeIcon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/search.svg',
            color: AppColor.mainColor,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/profile.svg',
            color: Colors.grey[700],
          ),
          activeIcon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/profile1.svg',
            color: AppColor.mainColor,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/notification.svg',
            color: Colors.grey[700],
          ),
          activeIcon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/notification1.svg',
            color: AppColor.mainColor,
          ),
          label: 'Notify',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/menu.svg',
            color: Colors.grey[700],
          ),
          activeIcon: SvgPicture.asset(
            width: getProportionateScreenWidht(width: 23),
            height: getProportionateScreenHeight(height: 23),
            'assets/icons/svg/menu.svg',
            color: AppColor.mainColor,
          ),
          label: 'Menu',
        ),
      ],
    );
  }
}
