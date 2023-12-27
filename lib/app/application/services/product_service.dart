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
      discount: 0,
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
      discount: 0,
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
      discount: 0,
      image:
          'https://img.freepik.com/free-vector/beauty-skin-care-background_52683-728.jpg?w=1060&t=st=1703407436~exp=1703408036~hmac=7ababb63da9db254d10805e4d7fb5015ae2acd81dd6e5795437b30bc5f113911',
      type: 'For woman',
      rating: 80,
      favorite: false,
      outStock: false,
      createAt: '2023-12-01',
    ),
    ProductModel(
      id: 4,
      category: 'Brand',
      name: 'Olive',
      descrpition: 'Olive cosmetics vector realistic poster',
      price: 45.55,
      qty: 1500,
      discount: 0,
      image:
          'https://img.freepik.com/free-vector/olive-cosmetics-vector-realistic-poster_88138-223.jpg?w=1380&t=st=1703484739~exp=1703485339~hmac=92c09e082c2ba19650b1393fb37275832fa174ca13585c2972bd8eda7467a075',
      type: 'For woman',
      rating: 50,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
    ProductModel(
      id: 5,
      category: 'Clothing',
      name: 'T-Shirt',
      descrpition:
          'ColorLog is a colorful Flutter logging package with emojis for more expressive and readable logs, simplifying debugging.',
      price: 20.00,
      qty: 2500,
      discount: 10,
      image:
          'https://img.freepik.com/free-photo/black-sweater-apparel-shoot-with-design-space_53876-102943.jpg?w=1060&t=st=1703484990~exp=1703485590~hmac=48d903be9005ac618409a428e6b9d7bca8e0203b45e1c0a4f1d5005667c9ad29',
      type: 'For Man',
      rating: 90,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
    ProductModel(
      id: 6,
      category: 'Clothing',
      name: 'T-Shirt',
      descrpition: 'Free photo white sweater front and back',
      price: 25.00,
      qty: 2500,
      discount: 15,
      image:
          'https://img.freepik.com/free-photo/white-sweater-front-back_125540-755.jpg?w=1060&t=st=1703485090~exp=1703485690~hmac=b9a344273f86196d2f4fe2b7645942387ce4bc92b421f2aaecc4cb0f55f75629',
      type: 'For Man',
      rating: 90,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
    ProductModel(
      id: 7,
      category: 'Clothing',
      name: 'T-Shirt',
      descrpition: 'Set of black hoodies front and back',
      price: 25.00,
      qty: 2500,
      discount: 10,
      image:
          'https://img.freepik.com/free-photo/set-black-hoodies-front-back_125540-2251.jpg?w=1380&t=st=1703485153~exp=1703485753~hmac=7635af14cf3058edbd9a3e56fa3acf2a8e60280788296993543f844e45edb119',
      type: 'Special',
      rating: 90,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
    ProductModel(
      id: 8,
      category: 'Shose',
      name: 'Streetwear',
      descrpition: 'Set of black hoodies front and back',
      price: 30.00,
      qty: 2500,
      discount: 20,
      image:
          'https://img.freepik.com/free-photo/gray-slip-unisex-streetwear-sneakers-fashion_53876-103578.jpg?w=1060&t=st=1703485711~exp=1703486311~hmac=5fd4d710e40d718d98c31f579acb9c0880b78fda9079d0b2379ecfc6a4544ded',
      type: 'For man',
      rating: 70,
      favorite: false,
      outStock: false,
      createAt: '2023-12-25',
    ),
  ].obs;

  RxList<ProductModel> spacialProduct = <ProductModel>[].obs;
  RxList<ProductModel> newProduct = <ProductModel>[].obs;
  RxList<ProductModel> popular = <ProductModel>[].obs;
  RxList<ProductModel> spacialDay = <ProductModel>[].obs;
}
