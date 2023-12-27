import 'package:e_store_app/app/application/export.dart';
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

  final productController = Get.put(ProductSevice());

  void findProductHotRelease() {
    DateTime sevenDaysAgo = DateTime.now().subtract(Duration(days: 7));
    productController.newProduct = productController.product
        .where((product) => date(product.createAt).isAfter(sevenDaysAgo))
        .toList()
        .obs;
  }

  void findSpecailProduct() {
    productController.spacialProduct = productController.product
        .where(
            (product) => product.type.toLowerCase() == 'special'.toLowerCase())
        .toList()
        .obs;
  }

  void findPopularProduct() {
    productController.popular = productController.product
        .where((product) => product.rating >= 80)
        .toList()
        .obs;
  }

  void findProductSpecialDay() {
    productController.spacialDay = productController.product
        .where((product) => product.discount > 0)
        .toList()
        .obs;
  }

  

  @override
  void initState() {
    super.initState();
    findProductHotRelease();
    findSpecailProduct();
    findPopularProduct();
    findProductSpecialDay();
  }

  bool viewAsList = true;

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
          SpecialDayProduct(),
          // Hot release
          ProductHotRelease(),
          // Popular
          PopularProduct(),
          // specail
          SpecailForYou(),
          // All Product
          AllProduct(
            onTapList: () {
              setState(() {
                viewAsList = true;
              });
            },
            onTapGrid: () {
              setState(() {
                viewAsList = false;
              });
            },
            listView: viewAsList,
          ),
          viewAsList ? ListProduct() : GridProduct(),
        ],
      ),
    );
  }
}
