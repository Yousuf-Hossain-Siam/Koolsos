// auth_controller.dart
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observable variables to store email and password
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var phone_number = ''.obs;
  var confirm_password = ''.obs;


  // Method to update email
  void updateEmail(String value) {
    email.value = value;
  }

  // Method to update password
  void updatePassword(String value) {
    password.value = value;
  }

  void updateFullname(String value) {
    email.value = value;
  }

  // Method to update password
  void updateNumber(String value) {
    password.value = value;
  }

  // Method to update password
  void updateNewPassword(String value) {
    password.value = value;
  }
}