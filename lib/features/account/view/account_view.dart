import 'package:flight_booking/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = Get.find<ThemeManager>();
    return Scaffold(
      body: Center(
        child: GetBuilder<ThemeManager>(
          builder: (context) {
            return Switch(
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeManager.toggoleTheme(value);
              },
            );
          },
        ),
      ),
    );
  }
}
