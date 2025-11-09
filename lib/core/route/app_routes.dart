import 'package:flight_booking/features/common/view/upcoming_view.dart';
import 'package:flight_booking/features/home/view/confirm_payment_view.dart';
import 'package:flight_booking/features/home/view/flight_details.dart';
import 'package:flight_booking/features/home/view/flight_list_view.dart';
import 'package:flight_booking/features/home/view/pay_now_view.dart';
import 'package:flight_booking/features/home/view/ticket_view.dart';
import 'package:flight_booking/features/main_bottom_nav_view/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings setting) {
    late final Widget screenWidget;

    if (setting.name == UpcomingView.name) {
      screenWidget = UpcomingView();
    } else if (setting.name == MainBottomNavView.name) {
      screenWidget = MainBottomNavView();
    } else if (setting.name == FlightListView.name) {
      screenWidget = FlightListView();
    } else if (setting.name == FlightDetails.name) {
      screenWidget = FlightDetails();
    } else if (setting.name == ConfirmPaymentView.name) {
      screenWidget = ConfirmPaymentView();
    } else if (setting.name == PayNowView.name) {
      screenWidget = PayNowView();
    } else if (setting.name == TicketView.name) {
      screenWidget = TicketView();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
