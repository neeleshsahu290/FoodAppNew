import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/screens/dashboard/dashboard_screen.dart';
import 'package:food_order_app/screens/login/ui/Welcome_screen.dart';
import 'package:food_order_app/widget/custom_transition_builder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));
  await GetStorage.init(localStorageContainer);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MyApp()));
  Future.delayed(const Duration(seconds: 1))
      .then((value) => FlutterNativeSplash.remove());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return
  // }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((context, orientation, screenType) => MaterialApp(
            title: ' Better You',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(elevation: 0.5),
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Colors.grey.shade100,
              primarySwatch: colorPrimaryAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              brightness: Brightness.light,
              primaryColor: colorPrimary,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CustomTransitionBuilder(),
                },
              ),
            ),
            home:  WelcomeScreen(),
          )),
    );
  }
}
