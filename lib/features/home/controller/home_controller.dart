import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  String selectedSeats = '';
  String selectedClasses = '';

  List<String> seats = [
    '1 Seats',
    '2 Seats',
    '3 Seats',
    '4 Seats',
    '5 Seats',
    '6 Seats',
    '7 Seats',
    '8 Seats',
    '9 Seats',
    '10 Seats',
    '11 Seats',
    '12 Seats',
  ];
  List<String> classes = ['Premium ', 'Economy', 'Business', 'First Class'];

  void updateSelectedFilter(int index) {
    selectedIndex = index;
    update();
  }

  void onTapSeadSelectedIndex(String value) {
    selectedSeats = value;
  }

  void onTapClassSelectedIndex(String value) {
    selectedClasses = value;
  }

  void updateWidger() {
    update();
  }
}
