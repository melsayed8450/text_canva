import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_canva/app_router.dart';
import 'package:text_canva/controller/home_controller/home_cubit.dart';
import 'package:text_canva/utils/app_colors.dart';
import 'package:text_canva/utils/methods.dart';

Future<void> main() async {
  await setupInitial();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeCubit(),
        child: ScreenUtilInit(
          designSize:const Size(410, 889),
          child: Builder(builder: (context) {
            log("building whole app");
            return MaterialApp.router(
              title: 'Text Canva',
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: ThemeData(
                useMaterial3: true,
                textTheme: GoogleFonts.poppinsTextTheme().copyWith(
                    bodyLarge: GoogleFonts.poppins(),
                    bodyMedium: GoogleFonts.poppins()),
                fontFamily: GoogleFonts.poppins().fontFamily,
                progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: AppColors.primaryColor,
                ),
              ),
            );
          }),
        ));
  }
}
