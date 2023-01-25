import 'package:animations/model/message.dart';

class MessageModel {
  int? updateId;
  Message? message;

  MessageModel({this.updateId, this.message});

  MessageModel.fromJson(Map<String, dynamic> json) {
    updateId = json['update_id'];
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['update_id'] = updateId;
  //   if (message != null) {
  //     data['message'] = message!.toJson();
  //   }
  //   return data;
  // }
}


