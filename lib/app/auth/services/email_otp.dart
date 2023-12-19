import 'package:get/get.dart';

class OTPEmail extends GetxController {
  RxString email = ''.obs;
  void setOTPEmail({required String email}) async {
    this.email = email.obs;
    update();
  }
}
