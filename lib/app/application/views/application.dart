import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(ScreenApplication());
  bool _isVisible = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _animationController.forward();
        setState(() {
          _isVisible = true;
        });
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _animationController.reverse();
        setState(() {
          _isVisible = false;
        });
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: defaultDuration,
      value: _isVisible ? 1.0 : 0.0,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: screens.length,
                onPageChanged: (value) {
                  setState(() {
                    controller.setScreenIndex(index: value);
                  });
                },
                itemBuilder: (context, cindex) =>
                    screens[controller.getIndex()],
              ),
              SizeTransition(
                sizeFactor: _animationController,
                axisAlignment: -1.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: defaultDuration,
                    width: double.infinity,
                    height: getProportionateScreenHeight(height: 60),
                    margin:
                        EdgeInsets.all(getProportionateScreenWidht(width: 16)),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
