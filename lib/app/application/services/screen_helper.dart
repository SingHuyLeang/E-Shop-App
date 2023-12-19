import 'package:get/get.dart';

class ScreenApplication extends GetxController {
  RxInt _index = 0.obs;
  RxInt get index => _index;
  void setScreenIndex({required int index}) async {
    _index = index.obs;
    update();
  }

  int getIndex() => _index.value;
}
