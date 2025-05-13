import 'package:get/get.dart';

class ToggleButtonController extends GetxController {
  RxBool isActive = true.obs;

  RxDouble buttonHeight = 30.0.obs;
  RxDouble buttonWidth = 50.0.obs;
  RxDouble borderRadius = 12.0.obs;

  void toggleState() {
    isActive.value = !isActive.value;

    // Change width depending on state
    if (isActive.value) {
      buttonWidth.value = 50.0; // width when Active
    } else {
      buttonWidth.value = 80.0; // width when Deactivate
    }
  }

  void updateHeight(double value) => buttonHeight.value = value;
  void updateWidth(double value) => buttonWidth.value = value;
  void updateBorderRadius(double value) => borderRadius.value = value;
}