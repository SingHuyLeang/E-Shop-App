import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ViewNetworkImage extends StatelessWidget {
  const ViewNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.fit, this.border,
  });

  final String url;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          border: border,
          color: Theme.of(context).colorScheme.primary,
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.center,
        child: LottieBuilder.asset(
          'assets/icons/json/waiting.json',
          width: getProportionateScreenWidht(width: 100),
          height: getProportionateScreenHeight(height: 100),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.center,
        child: LottieBuilder.asset(
          'assets/icons/json/not-found.json',
          width: getProportionateScreenWidht(width: 100),
          height: getProportionateScreenHeight(height: 100),
        ),
      ),
    );
  }
}
