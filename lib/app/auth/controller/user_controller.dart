import 'package:e_store_app/app/auth/export.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxList<UserModel> list = <UserModel>[].obs;

  void addUser(UserModel user) async {
    list.add(user);
    update();
  }
  
}
