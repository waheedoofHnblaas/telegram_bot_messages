import 'package:animations/controller/page1_cont.dart';
import 'package:animations/controller/video_controller.dart';
import 'package:animations/model/messageModel.dart';
import 'package:animations/view/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

InkWell AppMessageCard(
    Page1_Controller controller, MessageModel item, String imageUrl) {
  // VideoController videoControllerImp = Get.put(VideoController(imageUrl));

  return InkWell(
    onTap: () {
      controller.toData(item, imageUrl);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppCachImage(imageUrl: imageUrl),
            const SizedBox(
              width: 33,
            ),
            Expanded(
              child: Center(
                child: Text(
                  item.message!.caption.toString(),
                  style: TextStyle(
                      fontSize: 21, color: Get.theme.scaffoldBackgroundColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
