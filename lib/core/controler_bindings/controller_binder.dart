import 'package:flight_booking/core/theme/theme_manager.dart';
import 'package:flight_booking/features/home/controller/flight_list_controller.dart';
import 'package:flight_booking/features/home/controller/home_controller.dart';
import 'package:flight_booking/features/home/controller/pay_now_controller.dart';
import 'package:get/get.dart';

import '../../features/main_bottom_nav_view/controller/bottom_nav_view_model.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavViewController());
    Get.put(ThemeManager());
    Get.put(HomeController());
    Get.put(FlightListController());
    Get.put(PayNowController());
  }
}
