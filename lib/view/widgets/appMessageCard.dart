import 'package:animations/controller/page1_cont.dart';
import 'package:animations/model/messageModel.dart';
import 'package:animations/view/widgets/image_card.dart';
import 'package:flutter/material.dart';

InkWell AppMessageCard(
    Page1_Controller controller, MessageModel item, String imageUrl) {
  return InkWell(
    onTap: () {
      controller.toData(item, imageUrl);
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: SizedBox(
          child: AppCachImage(
            imageUrl: imageUrl,
          ),
        ),
        title: Text(item.message!.caption.toString()),
        subtitle: Text(item.message!.chat!.firstName.toString()),
      ),
    ),
  );
}