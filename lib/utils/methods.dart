import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:text_canva/utils/app_constants.dart';

Future<void> setupInitial() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive.init(Directory.current.path);
  // await Hive.openBox<Map<dynamic, dynamic>>(AppConstants.boxKey);
}
