import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../core/utils/color/app_color.dart';
import '../controller/bottom_nav_view_model.dart';

class MainBottomNavView extends StatefulWidget {
  const MainBottomNavView({super.key});

  static const String name = 'main-boot-nav';

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavViewController>(
        builder: (controller) {
          return controller.currentView();
        },
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 65.h,
        child: buildBottomNavSection(),
      ),
    );
  }

  Widget buildBottomNavSection() {
    List<Map<String, dynamic>> buttons = [
      {'icon': Icons.home, 'title': 'Home'},
      {'icon': Icons.save, 'title': 'saved'},
      {'icon': Icons.airplane_ticket_rounded, 'title': 'ticket'},
      {'icon': Icons.wallet, 'title': 'Wallet'},
      {'icon': Icons.person, 'title': 'Account'},
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons.asMap().entries.map((item) {
        return bottomNavCard(
          item.value['icon']!,
          item.key,
          item.value['title']!,
        );
      }).toList(),
    );
  }

  Widget bottomNavCard(IconData icon, int index, String title) {
    return GetBuilder<BottomNavViewController>(
      builder: (controller) {
        final Color color = controller.selectedIndex == index
            ? AppColors.primaryColor
            : Colors.grey;
        return GestureDetector(
          onTap: () => controller.onTapToChangeIndex(index),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color),
                Text(title, style: TextStyle(color: color)),
              ],
            ),
          ),
        );
      },
    );
  }
}
