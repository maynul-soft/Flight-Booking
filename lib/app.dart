import 'package:flight_booking/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/controler_bindings/controller_binder.dart';
import 'core/route/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/main_bottom_nav_view/view/main_bottom_nav_view.dart';

class FlightBooking extends StatelessWidget {
  const FlightBooking({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerBinder().dependencies();
    return GetBuilder<ThemeManager>(
      builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return GetMaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              themeMode: Get.find<ThemeManager>().themeMode,
              theme: AppTheme.lightThemeData,
              darkTheme: AppTheme.darkThemeData,
              initialRoute: MainBottomNavView.name,
              onGenerateRoute: AppRoutes.routes,
              home: child,
            );
          },
          child: const MainBottomNavView(),
        );
      },
    );
  }
}

class Language {}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
