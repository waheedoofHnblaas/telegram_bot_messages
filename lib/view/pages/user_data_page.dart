import 'package:animations/controller/page1_cont.dart';
import 'package:animations/controller/user_data_cont.dart';
import 'package:animations/core/class/statusrequest.dart';
import 'package:animations/model/messageModel.dart';
import 'package:animations/view/widgets/appMessageCard.dart';
import 'package:animations/view/widgets/cach_image_data.dart';
import 'package:animations/view/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserData_Page extends StatelessWidget {
  UserData_Page({Key? key}) : super(key: key);

  UserDataController controller = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<UserDataController>(
          builder: (controller11) {
            return controller.statusRequest == StatusRequest.loading
                ? const Text('...')
                : UserWidget(controller: controller);
          },
        ),
      ),
      body: Center(
        child: GetBuilder<UserDataController>(
          builder: (cont) {
            if (controller.statusRequest == StatusRequest.loading) {
              return const CircularProgressIndicator();
            } else {
              return ListView(
                controller: cont.scrollController,
                children: [
                  Text(
                    '${controller.user.firstName!} ${controller.user.lastName!}',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AppCachImageData(
                      imageUrl: controller.urlPath,
                    ),
                  ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.page1_controller.msgsList.length,
                    itemBuilder: (context, index) {
                      var list = controller.page1_controller.msgsList;
                      MessageModel mesg = list.keys.elementAt(index);
                      String imageUrl = list.values.elementAt(index);
                      if (mesg.message!.from!.username ==
                          controller.user.username) {
                        return AppMessageCard(
                          controller.page1_controller,
                          mesg,
                          imageUrl,
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

