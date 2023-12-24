import 'package:flutter/widgets.dart';

Future delayTime({required int milliseconds}) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

const Duration defaultDuration = Duration(milliseconds: 300);

late ScrollController scrollController;
