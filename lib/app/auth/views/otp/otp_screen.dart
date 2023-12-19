import 'dart:math';

import 'package:e_store_app/app/auth/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/app/components/widget/custoom_snackbar.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:e_store_app/routes/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpEmail = Get.find<OTPEmail>();
  final deviceManager = Get.put(DeviceManager());

  TextEditingController otpBox1 = TextEditingController();
  TextEditingController otpBox2 = TextEditingController();
  TextEditingController otpBox3 = TextEditingController();
  TextEditingController otpBox4 = TextEditingController();
  TextEditingController otpBox5 = TextEditingController();
  TextEditingController otpBox6 = TextEditingController();

  String getOTPCode() {
    return otpBox1.text +
        otpBox2.text +
        otpBox3.text +
        otpBox4.text +
        otpBox5.text +
        otpBox6.text;
  }

  // fake otp code
  String getVerifyCode() {
    int min = 100000;
    int max = 999999;

    Random random = Random();
    int number = min + random.nextInt(max - min + 1);
    print(number);
    return number.toString();
  }

  String number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidht(width: 20),
        ),
        child: Column(
          children: [
            CustoomHeader(
              crossAxisAlignment: CrossAxisAlignment.start,
              titleHeader: 'Verification Code',
              subTitleHeader: 'We have send the verificaton to',
              subTitleAlign: TextAlign.left,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: getProportionateScreenWidht(width: 20),
              ),
              child: AppText(
                text: otpEmail.email.toString(),
                color: AppColor.mainColor,
                textAlign: TextAlign.left,
              ),
            ),
            Gap(getProportionateScreenHeight(height: 40)),
            // OTP code input
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 6; i++)
                  SizedBox(
                    width: 50,
                    height: 60,
                    child: otpBox(
                      (i == 0)
                          ? otpBox1
                          : (i == 1)
                              ? otpBox2
                              : (i == 2)
                                  ? otpBox3
                                  : (i == 3)
                                      ? otpBox4
                                      : (i == 4)
                                          ? otpBox5
                                          : otpBox6,
                    ),
                  ),
              ],
            ),
            Gap(getProportionateScreenWidht(width: 15)),
            AppText(
              onTap: () {
                setState(() {
                  number = getVerifyCode();
                });
                showSnackBar(title: 'Verify Code', subTitle: number);
              },
              text: 'Send verify Code',
              color: AppColor.subColor,
            ),
            Gap(getProportionateScreenHeight(height: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // reset
                Expanded(
                  flex: 2,
                  child: AppButton(
                    text: 'Reset',
                    fontColor: AppColor.mainColor,
                    fontSize: 18,
                    border: Border.all(color: AppColor.lightSecondary),
                    onTap: () {
                      setState(() {
                        otpBox1.text = '';
                        otpBox2.text = '';
                        otpBox3.text = '';
                        otpBox4.text = '';
                        otpBox5.text = '';
                        otpBox6.text = '';
                      });
                    },
                  ),
                ),

                Gap(getProportionateScreenWidht(width: 15)),
                // Submit
                Expanded(
                  flex: 2,
                  child: AppButton(
                    text: 'Send',
                    color: (otpBox1.text.isEmpty ||
                            otpBox2.text.isEmpty ||
                            otpBox3.text.isEmpty ||
                            otpBox4.text.isEmpty ||
                            otpBox5.text.isEmpty ||
                            otpBox6.text.isEmpty)
                        ? Colors.grey[400]
                        : AppColor.mainColor,
                    onTap: () async {
                      if (getOTPCode().isEmpty) {
                        showSnackBar(
                          title: 'E-Shop',
                          subTitle:
                              'Please enter your OTP code\nWe has send already',
                        );
                      } else if (getOTPCode() == number) {
                        deviceManager
                            .setDeviceHasAlreadySignIn(true)
                            .whenComplete(() {
                          deviceManager
                              .getDeviceHasAlreadySignIn()
                              .whenComplete(() {
                            print(
                                'DeviceHasAlreadySignIn = ${deviceManager.deviceHasAlreadySignIn}');
                            Get.offNamedUntil(
                                RoutesName.splashScreen, (route) => false);
                          });
                        });
                      } else {
                        showSnackBar(
                          title: 'E-Shop',
                          subTitle: 'Your verify code is not correct',
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget otpBox(TextEditingController controller) => AppTextFiled(
        controller: controller,
        radius: 8,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontName.barlow,
          fontSize: getFontSize(width: 20),
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1) {
            if (otpBox6.text.isEmpty) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        },
      );
}
