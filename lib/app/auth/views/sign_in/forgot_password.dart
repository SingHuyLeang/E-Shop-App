import 'package:e_store_app/app/auth/export.dart';
import 'package:e_store_app/app/auth/services/validation.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/app/components/widget/custoom_snackbar.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _key = GlobalKey<FormState>();
  TextEditingController forgotPasswordController = TextEditingController();
  bool hasError = false;
  List<String> error = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => showSnackBar(
              title: 'If you fotgot your password',
              subTitle:
                  'Try to relax,\nAnd remeber your password i don\'t know too',
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(height: 8)),
              child: LottieBuilder.asset('assets/icons/json/bell.json'),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                LottieBuilder.asset(
                  'assets/icons/json/forgot_pw.json',
                  height: getProportionateScreenHeight(height: 150),
                ),
                Gap(getProportionateScreenHeight(height: 20)),
                CustoomHeader(
                  titleHeader: 'Forgot Password',
                  subTitleHeader: '',
                ),
                Gap(getProportionateScreenHeight(height: 20)),
                // fotgot password
                buildForgotPassword(),
                // has error
                AuthError(errors: error),
                Gap(getProportionateScreenHeight(height: 20)),
                AppButton(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                    }
                  },
                  text: 'Send',
                  color: AppColor.mainColor,
                ),
                // create new account
                NoAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForgotPassword() => AppTextFiled(
        controller: forgotPasswordController,
        hasError: hasError,
        hintText: 'Enter your email',
        label: 'Email',
        validator: (value) {
          if (value!.isEmpty && !error.contains(Validation().emptyFieldEmail)) {
            setState(() {
              error.add(Validation().emptyFieldEmail);
              hasError = true;
            });
          } else if (!Validation().emailRegExp.hasMatch(value) &&
              !error.contains(Validation().invalidEmail)) {
            setState(() {
              error.add(Validation().invalidEmail);
              hasError = true;
            });
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty &&
              error.contains(Validation().emptyFieldEmail)) {
            setState(() {
              error.remove(Validation().emptyFieldEmail);
              hasError = false;
            });
          } else if (Validation().emailRegExp.hasMatch(value) &&
              error.contains(Validation().invalidEmail)) {
            setState(() {
              error.remove(Validation().invalidEmail);
              hasError = false;
            });
          }
        },
      );
}
