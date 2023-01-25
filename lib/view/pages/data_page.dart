import 'package:animations/controller/data_cont.dart';
import 'package:animations/view/widgets/cach_image_data.dart';
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
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                controller.toUserData(
                    controller.message.keys.elementAt(0).message!.from!);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                      controller.message.keys.elementAt(0).message!.from!.username!),
                ),
              ),
            ),
          ),
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
                  Container(
                    decoration: BoxDecoration(
                        color: Get.theme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22))),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.message.keys.elementAt(0).message!.caption!,
                      style: const TextStyle(fontSize: 33),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
