import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final GetStorage box = GetStorage();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late bool remembePassword;
  Future<void> setRememberPassword(value) async {
    await box.write('remembePassword', remembePassword);
    update();
  }

  void getRememberPassword() {
    remembePassword = box.read('remembePassword') ?? false;
    print("a");
    update();
  }

  String? email;
  Future<void> setEmail(String setemail) async {
    email = setemail;
    await box.write('email', email);
    update();
  }

  Future<void> removeEmail() async {
    await box.remove('email');
  }

  late String pass;
  void setpass(String setpass) {
    pass = setpass;
    update();
  }

  bool passObscure = true;

  getEmail() {
    final String savedemail = box.read('email') ?? '';
    email = savedemail;
    update();
  }

  Future<void> onSuccess(String? singupEmail) async {}

  @override
  onInit() {
    getEmail();
    getRememberPassword();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    // await updateListSenders();
    super.onClose();
  }
}
