import 'package:e_store_app/app/auth/export.dart';
import 'package:e_store_app/app/auth/services/validation.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/routes/routes_name.dart';
import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final keyForm = GlobalKey<FormState>();

  bool isShow = false;
  bool emailFieldError = false;
  bool passwordFieldError = false;

  List<String> emailError = [];
  List<String> passwordError = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final otpEmail = Get.put(OTPEmail());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Gap(SizeConfig.screenHeight * 0.04),
                  LottieBuilder.asset(
                    'assets/icons/json/signin.json',
                    height: getProportionateScreenHeight(height: 150),
                  ),
                  CustoomHeader(
                    titleHeader: 'Welcome back',
                    subTitleHeader:
                        'Sign in with your email and password or\nContinue with social media',
                  ),
                  Gap(getProportionateScreenHeight(height: 40)),
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
                  // forgot password
                  Align(
                    child: AppButton(
                      onTap: () => Get.toNamed(RoutesName.forgotPassword),
                      height: 20,
                      fontColor: AppColor.mainColor,
                      fontSize: 16,
                      text: 'Forgot password ?',
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  Gap(getProportionateScreenHeight(height: 20)),
                  AppButton(
                    text: 'Sign In',
                    color: AppColor.mainColor,
                    onTap: () {
                      if (keyForm.currentState!.validate()) {
                        keyForm.currentState!.save();
                      }
                      if (!emailFieldError && !passwordFieldError) {
                        otpEmail.setOTPEmail(email: emailController.text);
                        Get.toNamed(RoutesName.otp);
                      }
                    },
                  ),
                  Gap(SizeConfig.screenHeight * 0.03),
                  // Socail Media
                  SocailMedia(),
                  // Register
                  NoAccount(),
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
      obscureText: isShow,
      hasError: passwordFieldError,
      suffixIcons: custoomSuffixIcons(
        isShow
            ? 'assets/icons/json/close_eye.json'
            : 'assets/icons/json/open_eye.json',
        padding: isShow ? 12 : 10,
        onTap: () {
          setState(() {
            isShow = !isShow;
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
}
