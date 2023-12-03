import 'package:get/get.dart';

class SigninController extends GetxController {
  final RxBool rxObscurePassword = false.obs;
  bool get obscurePassword => rxObscurePassword.value;
  set obscurePassword(bool newValue) => rxObscurePassword.value = newValue;

  onTapTogglePassword() {
    obscurePassword = !obscurePassword;
  }
}
