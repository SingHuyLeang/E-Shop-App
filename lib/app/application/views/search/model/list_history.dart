import 'package:get/get.dart';

class SearchHistory extends GetxController {
  RxList<String> history = <String>[].obs;

  void add(String data) async {
    history.add(data);
    update();
  }

  void remove(String data) async {
    history.remove(data);
    update();
  }

  void clear() async {
    history.clear();
    update();
  }

  bool find(String contain) {
    return history.contains(contain);
  }
}
