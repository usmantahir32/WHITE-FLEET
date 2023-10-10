import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/auth_cont.dart';
import 'utils/size_config.dart';
import 'views/pages/bottom nav bar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            Get.put(AuthCont());
            return GetMaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(
                  labelSmall: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.textMultiplier * 1.2),
                  bodyLarge: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.8),
                  bodyMedium: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.6),
                  bodySmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.4),
                  displaySmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.2),
                  headlineLarge: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 2.8),
                  headlineMedium: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 2.3),
                  headlineSmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 2.2),
                ),
                fontFamily: 'Poppins',
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              home: BottomNavBarScreen(),
            );
          },
        );
      },
    );
  }
}
