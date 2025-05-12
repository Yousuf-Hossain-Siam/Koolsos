import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxBool isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void setCheckbox(bool value) {
    isChecked.value = value;
  }
}
