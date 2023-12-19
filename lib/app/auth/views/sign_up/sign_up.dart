import 'dart:developer';
import 'package:e_store_app/app/auth/export.dart';
import 'package:e_store_app/app/auth/services/validation.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final keyForm = GlobalKey<FormState>();

  bool isShowPass = false;
  bool isShowConPass = false;

  bool emailFieldError = false;
  bool passwordFieldError = false;
  bool conPasswordFieldError = false;

  List<String> emailError = [];
  List<String> passwordError = [];
  List<String> confirmpasswordError = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: getProportionateScreenWidht(width: 20),
            ),
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  LottieBuilder.asset(
                    'assets/icons/json/signup.json',
                    height: getProportionateScreenHeight(height: 150),
                  ),
                  CustoomHeader(
                    titleHeader: 'Register',
                    subTitleHeader:
                        'Enter your detail to create your account or\nContinue with social media',
                  ),
                  Gap(getProportionateScreenHeight(height: 20)),
                  // Email
                  builEmailField(),
                  // error email
                  AuthError(errors: emailError),
                  Gap(getProportionateScreenHeight(height: 20)),
                  // Password
                  buildPasswordField(),
                  // error password
                  AuthError(errors: passwordError),
                  Gap(getProportionateScreenHeight(height: 20)),
                  // Password
                  buildConfirmPasswordField(),
                  // error password
                  AuthError(errors: confirmpasswordError),
                  Gap(getProportionateScreenHeight(height: 20)),
                  //
                  AppButton(
                    text: 'Contines',
                    color: AppColor.mainColor,
                    onTap: () {
                      if (keyForm.currentState!.validate()) {
                        keyForm.currentState!.save();
                      }
                      log('email    : ${emailController.text}');
                      log('password : ${passwordController.text}');
                      log('password : ${conPasswordController.text}');
                    },
                  ),
                  Gap(SizeConfig.screenHeight * 0.02),
                  // Socail Media
                  SocailMedia(),
                  AppText(
                    text:
                        'By continuning your confirnm that you agree\nwith your Term and Condition',
                    fontSize: getFontSize(width: 14),
                    textAlign: TextAlign.center,
                  ),
                  Gap(getProportionateScreenHeight(height: 10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builEmailField() {
    return AppTextFiled(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      hasError: emailFieldError,
      hintText: 'Enter your email',
      label: 'Email',
      validator: (value) {
        if (value!.isEmpty &&
            !emailError.contains(Validation().emptyFieldEmail)) {
          setState(() {
            emailError.add(Validation().emptyFieldEmail);
            emailFieldError = true;
          });
        } else if (!Validation().emailRegExp.hasMatch(value) &&
            !emailError.contains(Validation().invalidEmail)) {
          setState(() {
            emailError.add(Validation().invalidEmail);
            emailFieldError = true;
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty &&
            emailError.contains(Validation().emptyFieldEmail)) {
          setState(() {
            emailError.remove(Validation().emptyFieldEmail);
            emailFieldError = false;
          });
        } else if (Validation().emailRegExp.hasMatch(value) &&
            emailError.contains(Validation().invalidEmail)) {
          setState(() {
            emailError.remove(Validation().invalidEmail);
            emailFieldError = false;
          });
        }
      },
    );
  }

  Widget buildPasswordField() {
    return AppTextFiled(
      keyboardType: TextInputType.visiblePassword,
      controller: passwordController,
      hintText: 'Enter your password',
      label: 'Password',
      obscureText: isShowPass,
      hasError: passwordFieldError,
      suffixIcons: custoomSuffixIcons(
        isShowPass
            ? 'assets/icons/json/close_eye.json'
            : 'assets/icons/json/open_eye.json',
        padding: isShowPass ? 12 : 10,
        onTap: () {
          setState(() {
            isShowPass = !isShowPass;
          });
        },
      ),
      validator: (value) {
        if (value!.isEmpty &&
            !passwordError.contains(Validation().emptyFieldPassword)) {
          setState(() {
            passwordError.add(Validation().emptyFieldPassword);
            passwordFieldError = true;
          });
        } else if (value.length < 8 &&
            !passwordError.contains(Validation().shortPassword)) {
          setState(() {
            passwordError.add(Validation().shortPassword);
            passwordFieldError = true;
          });
        } else if (!Validation().passwordRegExp.hasMatch(value) &&
            !passwordError.contains(Validation().weakPassword)) {
          setState(() {
            passwordError.add(Validation().weakPassword);
            passwordFieldError = true;
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty &&
            passwordError.contains(Validation().emptyFieldPassword)) {
          setState(() {
            passwordError.remove(Validation().emptyFieldPassword);
            passwordFieldError = false;
          });
        }
        if (value.length < 8 &&
            passwordError.contains(Validation().shortPassword)) {
          setState(() {
            passwordError.remove(Validation().shortPassword);
            passwordFieldError = false;
          });
        }
        if (Validation().passwordRegExp.hasMatch(value) &&
            passwordError.contains(Validation().weakPassword)) {
          setState(() {
            passwordError.remove(Validation().weakPassword);
            passwordFieldError = false;
          });
        }
      },
    );
  }

  Widget buildConfirmPasswordField() {
    return AppTextFiled(
      keyboardType: TextInputType.visiblePassword,
      controller: conPasswordController,
      hintText: 'Enter your confirm password',
      label: 'Confirm Password',
      obscureText: isShowConPass,
      hasError: conPasswordFieldError,
      suffixIcons: custoomSuffixIcons(
        isShowConPass
            ? 'assets/icons/json/close_eye.json'
            : 'assets/icons/json/open_eye.json',
        padding: isShowConPass ? 12 : 10,
        onTap: () {
          setState(() {
            isShowConPass = !isShowConPass;
          });
        },
      ),
      validator: (value) {
        if (value!.isEmpty &&
            !confirmpasswordError
                .contains(Validation().emptyFieldConfirmPassword)) {
          setState(() {
            confirmpasswordError.add(Validation().emptyFieldConfirmPassword);
            conPasswordFieldError = true;
          });
        } else if (value != passwordController.text) {
          setState(() {
            confirmpasswordError.add(Validation().passwordNotEqual);
            conPasswordFieldError = true;
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty &&
            confirmpasswordError
                .contains(Validation().emptyFieldConfirmPassword)) {
          setState(() {
            confirmpasswordError.remove(Validation().emptyFieldConfirmPassword);
            conPasswordFieldError = false;
          });
        } else if (value == passwordController.text) {
          setState(() {
            confirmpasswordError.remove(Validation().passwordNotEqual);
            conPasswordFieldError = false;
          });
        }
      },
    );
  }
}
