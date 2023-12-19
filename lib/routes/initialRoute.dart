import 'package:e_store_app/routes/device_already_signin.dart';
import 'package:e_store_app/routes/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialRoute extends StatefulWidget {
  const InitialRoute({super.key});

  @override
  State<InitialRoute> createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> {
  final deviceManager = Get.put(DeviceManager());

  @override
  void initState() {
    deviceManager.getDeviceHasAlreadySignIn().whenComplete(() {
      if (deviceManager.deviceHasAlreadySignIn.value == true) {
        Get.offNamedUntil(RoutesName.splashScreen, (route) => false);
      } else {
        Get.offNamedUntil(RoutesName.introScreen, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
