
import 'package:animations/controller/data_cont.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DataController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: InkWell(
        onTap: () {
          controller.toUserData(
              controller.message.keys.elementAt(0).message!.from!);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Center(
            child: Text(controller.message.keys
                .elementAt(0)
                .message!
                .from!
                .username!),
          ),
        ),
      ),
    );
  }
}