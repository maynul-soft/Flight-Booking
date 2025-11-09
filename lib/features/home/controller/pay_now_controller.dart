import 'package:get/get.dart';

class PayNowController extends GetxController {
  bool defaultValue = true;

  onChangeSwithcValue(bool value) {
    defaultValue = value;
    update();
  }
}
