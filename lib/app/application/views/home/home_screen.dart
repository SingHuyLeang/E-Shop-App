import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/application/views_model/popular_product.dart';
import 'package:e_store_app/app/components/widget/custoom_text.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/delaytime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ScreenApplication());

  List<Map<String, dynamic>> category = [
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
    {'icon': 'assets/icons/svg/category.svg', 'title': 'This\'s title'},
  ];

  List<String> ads = [
    'https://img.freepik.com/free-vector/set-two-cosmetic-containers-golden-podium-one-near-by-with-place-text_1268-15462.jpg?w=1380&t=st=1703043422~exp=1703044022~hmac=29ccf512d00fc7c7e0c96a733372d5c5d839a187e6e623d33a4cf28ba4453d63',
    'https://img.freepik.com/free-vector/realistic-sunscreen-bottle-promo_52683-62723.jpg?w=1060&t=st=1703043503~exp=1703044103~hmac=b78277dc6f127f5097467fb8dda499117aa2644cf593b1ecc965294a9b111206',
    'https://img.freepik.com/free-vector/sunscreen-ad-realistic-style_23-2148251120.jpg?w=1060&t=st=1703043520~exp=1703044120~hmac=5aaf5f1fca8916fe89e048a6c518cdf3e0da423d86865646bef32c506ad64cdd',
    'https://img.freepik.com/free-vector/realistic-ad-template-natural-cream_23-2148255735.jpg?w=1060&t=st=1703043542~exp=1703044142~hmac=ffdbd44d95bb858d6b3e986dd6842bd89845f0d7892eb6451a7521533b391e3d',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          // app bar
          ShopAppBar(),
          // category
          CategoryViewer(category: category),
          // ads
          AdsSlider(ads: ads),
          // Hot release
          ProductHotRelease(),
          // Popular
          PopularProduct(),
          // specail
          SpecailForYou(),
          // All Product
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidht(width: 10),
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppText(text: 'List', fontSize: getFontSize(width: 20)),
                      AppText(text: 'Grid', fontSize: getFontSize(width: 20)),
                    ],
                  ),
                  CustomPaint(
                    painter: UnderlinePainter(
                      Theme.of(context).colorScheme.onPrimary,
                      1.1,
                    ),
                    size: Size(double.infinity, 1.1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UnderlinePainter extends CustomPainter {
  final Color lineColor;
  final double lineHeight;

  UnderlinePainter(this.lineColor, this.lineHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
