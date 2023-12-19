import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/routes/export.dart';
import 'package:e_store_app/public/theme/services/theme_service.dart';
import 'package:e_store_app/public/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Size config init
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().light,
      darkTheme: Themes().dark,
      themeMode: ThemeService().theme,
      initialRoute: RoutesName.initialRoute,
      routes: routes,
    );
  }
}
