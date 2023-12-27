import 'dart:developer';

import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final controller = Get.put(ScreenApplication());
  final _formKey = GlobalKey<FormState>();

  String? suggestion;
  List<String> history = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenHeight(height: 80),
                  child: buildSearchField(),
                ),
                if (history.isEmpty)
                  Center(
                    child: Lottie.asset('assets/icons/json/find-product.json'),
                  )
                else if (!searchController.text.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'History',
                              fontSize: getFontSize(width: 18),
                            ),
                            Gap(getProportionateScreenWidht(width: 5)),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Gap(getProportionateScreenWidht(width: 5)),
                            AppText(
                              text: 'Clear all',
                              fontSize: getFontSize(width: 16),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(0.7),
                              onTap: () {
                                setState(() {
                                  // clear all history
                                  history.clear();
                                });
                              },
                            ),
                          ],
                        ),
                        Gap(getProportionateScreenWidht(width: 10)),
                        Column(
                          children: List.generate(
                            history.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                                right: 10,
                                bottom: getProportionateScreenHeight(height: 8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: AppText(
                                      text: history[index],
                                      fontSize: getFontSize(width: 18),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          history.remove(history[index]);
                                        });
                                        history.forEach(
                                          (element) => log(element),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/svg/cross.svg',
                                        width: getProportionateScreenWidht(
                                          width: 15,
                                        ),
                                        height: getProportionateScreenHeight(
                                          height: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppTextFiled buildSearchField() {
    return AppTextFiled(
      keyboardType: TextInputType.text,
      controller: searchController,
      hintText: 'Search anything...',
      radius: getProportionateScreenWidht(width: 26),
      suffixIcons: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState!.save();
          }
          history.addIf(
            searchController.text.isNotEmpty &&
                !history.contains(searchController.text),
            searchController.text,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/svg/search.svg',
            // ignore: deprecated_member_use
            color: AppColor.mainColor,
          ),
        ),
      ),
      validator: (text) {
        if (text!.isNotEmpty) {
          setState(() {
            suggestion = text;
          });
        }
        return null;
      },
      onChanged: (text) {
        if (text.isNotEmpty) {
          setState(() {
            suggestion = text;
          });
        }
      },
    );
  }
}
