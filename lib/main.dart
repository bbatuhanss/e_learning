import 'package:e_learning_app/theme/light_theme.dart';
import 'package:e_learning_app/utils/top_navigator_key.dart';
import 'package:e_learning_app/views/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Written by Batuhan
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale('en'), Locale('tr')],
        title: 'elearning',
        navigatorKey: topNavigatorKey,
        theme: kLightTheme,
        home: const DashboardPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}