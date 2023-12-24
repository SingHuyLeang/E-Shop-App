
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget actions({bool favorite=false,required void Function() onTapFavorite,required void Function() onTapComment,required BuildContext context}) {
    return Container(
      width: getProportionateScreenWidht(width: 30),
      height: getProportionateScreenHeight(height: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapFavorite,
            child: SvgPicture.asset(
              'assets/icons/svg/${!favorite ? 'favorite' : 'favorite-true'}.svg',
              width: getProportionateScreenWidht(width: 25),
              height: getProportionateScreenHeight(height: 25),
              // ignore: deprecated_member_use
              color: favorite
                  ? Colors.red
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          GestureDetector(
            onTap: onTapComment,
            child: SvgPicture.asset(
              'assets/icons/svg/comment.svg',
              width: getProportionateScreenWidht(width: 23),
              height: getProportionateScreenHeight(height: 23),
              // ignore: deprecated_member_use
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }