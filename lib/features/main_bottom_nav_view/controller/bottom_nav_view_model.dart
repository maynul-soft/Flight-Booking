import 'package:flight_booking/features/account/view/account_view.dart';
import 'package:flight_booking/features/common/view/upcoming_view.dart';
import 'package:flight_booking/features/home/view/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavViewController extends GetxController {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    UpcomingView(),
    UpcomingView(),
    UpcomingView(),
    AccountView(),
  ];

  onTapToChangeIndex(index) {
    selectedIndex = index;
    currentView();
    update();
  }

  onTapToSearchScreen() {
    selectedIndex = 0;
    update();
  }

  currentView() {
    return screens[selectedIndex];
  }
}
