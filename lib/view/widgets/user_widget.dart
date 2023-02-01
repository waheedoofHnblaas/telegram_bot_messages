import 'package:animations/controller/user_data_cont.dart';
import 'package:animations/view/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UserDataController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${controller.user.username}'),
        Card(
          color: Get.theme.scaffoldBackgroundColor,
          elevation: 0,
          child: Row(
            children: [
              controller.scrollController.offset > 21
                  ? Text('  ${controller.user.firstName}')
                  : Container(),
              const SizedBox(
                width: 10,
              ),
              controller.scrollController.offset > 400
                  ? AppCachImage(imageUrl: controller.urlPath)
                  : const SizedBox(
                      width: 44,
                      height: 44,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
