import 'package:animations/core/class/statusrequest.dart';
import 'package:animations/core/constant/approutes.dart';
import 'package:animations/core/function/handlingdata.dart';
import 'package:animations/core/services/services.dart';
import 'package:animations/links.dart';
import 'package:animations/model/datasource/remote/home/homeData.dart';
import 'package:animations/model/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';

class Page1_Controller extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  Map<MessageModel, String> msgsList = {};
  final bot = Bot(token: AppLinks.TOKEN);

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  up() {
    update();
  }

  Future getImage(fileId) async {
    try {
      final file = await bot.getFile(fileId);
      String fileUrl =
          "https://api.telegram.org/file/bot${AppLinks.TOKEN}/${file.filePath}";
      update();
      return fileUrl;
    } catch (e) {
      return '';
    }
  }

  Future getData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');
    msgsList.clear();

    var response = await homeData.homeData();
    statusRequest = handlingData(response);

    print(response);
    if (statusRequest == StatusRequest.success) {
      if (response['ok'] == true) {
        List msgs = [];
        if (response['result'] != []) {
          msgs = response['result'];
        }
        for (var element in msgs) {
          var ele = MessageModel.fromJson(element);
           print('========== getData ===========');
           print(element);
          if (ele.message != null) {
            if (ele.message!.caption != null) {
              if (ele.message!.document != null) {
                msgsList.addAll({
                  ele: await getImage(
                    ele.message!.document!.fileId,
                  )
                });
              } else if (ele.message!.photo != null) {
                msgsList.addAll({
                  ele: await getImage(
                    ele.message!.photo,
                  )
                });
              }else if(ele.message!.video != null){
                msgsList.addAll({
                  ele: await getImage(
                    ele.message!.video!.fileId,
                  )
                });
              }
            }
          }
        }
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no data available',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Get.theme.backgroundColor,
      messageText:  Center(
          child: Text(
        'done update',
        style: TextStyle(color: Get.theme.primaryColor),
      )),
      duration: const Duration(
        seconds: 2,
      ),
    ));
    update();
    return msgsList;
  }

  void toData(MessageModel item, String imageUrl) {
    Get.toNamed(AppRoute.page_data, arguments: [item, imageUrl]);
  }
}
