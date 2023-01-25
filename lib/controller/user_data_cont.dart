import 'package:animations/controller/page1_cont.dart';
import 'package:animations/core/class/statusrequest.dart';
import 'package:animations/core/function/handlingdata.dart';
import 'package:animations/model/datasource/remote/home/userData.dart';
import 'package:animations/model/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserDataController extends GetxController {
  late From user;
  String urlPath = '';
  StatusRequest? statusRequest = StatusRequest.none;
  final UserData userData = UserData(Get.find());
  Page1_Controller page1_controller = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    scrollController.addListener(() {
      print(scrollController.offset);
      update();
    });
    user = Get.arguments;
    await getUserPhoto(user.id.toString());
    update();

    super.onInit();
  }

  Future<String> getUserPhoto(String userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.userData(userId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['ok'] == true) {
        if (response['result'] != []) {
          urlPath = await page1_controller.getImage(
            response['result']['photos'][0][0]['file_id'],
          );
          print(urlPath);
          print('============================');
        }
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no data available',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: Get.theme.backgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    // final response = await http.post(
    //   Uri.parse(AppLinks.getUserProfilePhotos),
    //   body: {'user_id': userId},
    // );
    // print(response.body);
    return urlPath;
  }
}
