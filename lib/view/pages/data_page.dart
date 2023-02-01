import 'package:animations/controller/data_cont.dart';
import 'package:animations/view/widgets/cach_image_data.dart';
import 'package:animations/view/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DataPage extends StatelessWidget {
  DataPage({Key? key}) : super(key: key);
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATA'),
        actions: [
          UserDataWidget(controller: controller),
        ],
      ),
      body: Center(
        child: GetBuilder<DataController>(
          builder: (controller) {
            if (controller.message.isEmpty) {
              return const Text('loading');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppCachImageData(
                      imageUrl: controller.message.values.elementAt(0)),
                  productNameWidget(controller),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Container productNameWidget(DataController controller) {
    return Container(
      width: Get.width / 1.5,
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(22))),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          controller.message.keys.elementAt(0).message!.caption!,
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 28,
            color: Get.theme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
