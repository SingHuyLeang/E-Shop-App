import 'package:e_store_app/app/application/export.dart';
import 'package:get/get.dart';

class ProductSevice extends GetxController {
  RxList<ProductModel> product = <ProductModel>[
    ProductModel(
      id: 1,
      category: 'Sun Screen',
      name: 'Summer',
      descrpition: 'Watering Mosture',
      price: 19.99,
      qty: 1000,
      image:
          'https://img.freepik.com/free-vector/sunscreen-ad-realistic-style_23-2148251120.jpg?w=1060&t=st=1703043520~exp=1703044120~hmac=5aaf5f1fca8916fe89e048a6c518cdf3e0da423d86865646bef32c506ad64cdd',
      type: 'special',
      rating: 60,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
    ProductModel(
      id: 2,
      category: 'Cream',
      name: 'Brand',
      descrpition: 'Make up products arrangement top view',
      price: 24.99,
      qty: 100,
      image:
          'https://img.freepik.com/free-photo/make-up-products-arrangement-top-view_23-2149096666.jpg?w=1060&t=st=1703407224~exp=1703407824~hmac=3a7121128553afde93f6ab40f7cdbf5b002bb2aa65dda9d2daeb4f7f17c48ab8',
      type: 'special',
      rating: 80,
      favorite: false,
      outStock: false,
      createAt: '2023-12-01',
    ),
    ProductModel(
      id: 3,
      category: 'Skin Care',
      name: 'Beauty Skin Care',
      descrpition: 'Free vector beauty skin care background',
      price: 30.55,
      qty: 200,
      image:
          'https://img.freepik.com/free-vector/beauty-skin-care-background_52683-728.jpg?w=1060&t=st=1703407436~exp=1703408036~hmac=7ababb63da9db254d10805e4d7fb5015ae2acd81dd6e5795437b30bc5f113911',
      type: 'For woman',
      rating: 80,
      favorite: false,
      outStock: false,
      createAt: '2023-12-01',
    ),
  ].obs;

  RxList<ProductModel> spacialProduct = <ProductModel>[].obs;
  RxList<ProductModel> newProduct = <ProductModel>[].obs;
  RxList<ProductModel> popular = <ProductModel>[].obs;
}
