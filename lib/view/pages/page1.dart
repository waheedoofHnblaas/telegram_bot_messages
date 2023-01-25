import 'package:animations/controller/page1_cont.dart';
import 'package:animations/core/class/statusrequest.dart';
import 'package:animations/core/constant/approutes.dart';
import 'package:animations/model/messageModel.dart';
import 'package:animations/view/widgets/appMessageCard.dart';
import 'package:animations/view/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  Page1_Controller controller = Get.put(Page1_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
        actions: [
          GetBuilder<Page1_Controller>(builder: (c) {
            return IconButton(
                onPressed: () async {
                  await c.getData();
                },
                icon: const Icon(Icons.refresh));
          })
        ],
      ),
      body: Center(
        child: GetBuilder<Page1_Controller>(
          builder: (controller) {
            if (controller.statusRequest == StatusRequest.loading) {
              return const CircularProgressIndicator();
            } else if (controller.statusRequest == StatusRequest.serverExp) {
              return const Text('No Internet Connection');
            } else {
              return ListView.builder(
                itemCount: controller.msgsList.length,
                itemBuilder: (context, index) {
                  var item = controller.msgsList.keys.elementAt(index);
                  var imageUrl = controller.msgsList.values.elementAt(index);
                  return AppMessageCard(controller, item, imageUrl);
                },
              );
            }
          },
        ),
      ),
    );
  }

}
