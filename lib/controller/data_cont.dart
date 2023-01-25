import 'package:animations/core/constant/approutes.dart';
import 'package:animations/model/form.dart';
import 'package:animations/model/messageModel.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Map<MessageModel, String> message = {};

  @override
  void onInit() {
    message = {Get.arguments[0]: Get.arguments[1]};
    update();
    super.onInit();
  }

  void toUserData(From from) {
    Get.toNamed(AppRoute.user_data, arguments: from);
  }
}
