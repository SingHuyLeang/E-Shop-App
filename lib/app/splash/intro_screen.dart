import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:e_store_app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int pageIndex = 0;
  List<Map<String, dynamic>> introData = [
    {
      'text': 'Welcome to Cambodia, Let\'s shop',
      'image': 'assets/icons/icons/splash_1.png',
    },
    {
      'text':
          'We help people connect with store \naround United State Of America',
      'image': 'assets/icons/icons/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop. \nJust stay at home with us',
      'image': 'assets/icons/icons/splash_3.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // page views
              Expanded(
                flex: 4,
                child: PageView.builder(
                  itemCount: introData.length,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => intro(
                    introData[pageIndex]['text'],
                    introData[pageIndex]['image'],
                  ),
                ),
              ),
              Gap(getProportionateScreenHeight(height: 25)),
              // button
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introData.length,
                        (index) => builDot(index: index),
                      ),
                    ),
                    Gap(getProportionateScreenHeight(height: 25)),
                    Padding(
                      padding: EdgeInsets.all(
                        getProportionateScreenWidht(width: 20),
                      ),
                      child: AppButton(
                        text: pageIndex == 0 || pageIndex == 1
                            ? 'Next'
                            : 'Continue',
                        color: AppColor.mainColor,
                        onTap: () {
                          if (pageIndex == 0 || pageIndex == 1) {
                            setState(() {
                              pageIndex++;
                            });
                          } else {
                            Get.offNamedUntil(
                              RoutesName.signIn,
                              (route) => false,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget intro(String text, String image) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Cambodia'.toUpperCase(),
          style: TextStyle(
            fontSize: getProportionateScreenWidht(width: 36),
            color: AppColor.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidht(width: 16),
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          width: getProportionateScreenWidht(width: 235),
          height: getProportionateScreenHeight(height: 265),
        ),
      ],
    );
  }

  Widget builDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: pageIndex == index ? 26 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: pageIndex == index ? AppColor.mainColor : AppColor.subColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
