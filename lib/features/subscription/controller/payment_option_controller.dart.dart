import 'package:get/get.dart';

class PaymentOptionController extends GetxController {
  var selectedOptions = <String>{}.obs;

  void toggleOption(String optionKey, bool isChecked) {
    if (isChecked) {
      selectedOptions.add(optionKey);
    } else {
      selectedOptions.remove(optionKey);
    }
  }

  bool isSelected(String optionKey) {
    return selectedOptions.contains(optionKey);
  }
}
