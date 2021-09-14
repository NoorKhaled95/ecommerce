import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/provider/db_provider.dart';
import 'package:maan_application_2/helper/route_helper.dart';
import 'package:maan_application_2/splash_screen.dart';
import 'package:maan_application_2/provider/theme_provider.dart';
import 'package:maan_application_2/ui/home/providers/home_provider.dart';
import 'package:maan_application_2/ui/product_details/providers/product_details_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<ProductDetailsProvider>(
          create: (context) => ProductDetailsProvider(),
        ),
        ChangeNotifierProvider<DbProvider>(
          create: (context) => DbProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: RouteHelper.routeHelper.navKey,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}
