import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/colors/app_colors.dart';
import 'core/storage/cache_helper.dart';
import 'core/network/dio_helper.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X resolution
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Store App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColorScheme.background,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColorScheme.redPrimary,
            ),
            useMaterial3: false,
            appBarTheme: AppBarTheme(color: AppColorScheme.white, elevation: 0),
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
