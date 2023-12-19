import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceManager extends GetxController {
  final String deviceKey = 'DEVICE_KEY';
  RxBool deviceHasAlreadySignIn = false.obs;

  Future setDeviceHasAlreadySignIn(bool hasSignIn) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(deviceKey, hasSignIn);
    update();
  }

  Future getDeviceHasAlreadySignIn() async {
    final pref = await SharedPreferences.getInstance();
    deviceHasAlreadySignIn.value = await pref.getBool(deviceKey) ?? false;
    update();
  }
}
