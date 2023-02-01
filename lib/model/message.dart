import 'package:animations/model/chat.dart';
import 'package:animations/model/document.dart';
import 'package:animations/model/form.dart';
import 'package:animations/model/vedio.dart';

class Message {
  int? messageId;
  From? from;
  Chat? chat;
  int? date;
  String? photo;
  Video? video;
  Document? document;
  String? caption;

  Message({
    this.messageId,
    this.from,
    this.chat,
    this.date,
    this.document,
    this.photo,
    this.caption,
  });

  Message.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    from = json['from'] != null ? From.fromJson(json['from']) : null;
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
    date = json['date'];
    photo = json['photo'] != null ? json['photo'][1]['file_id'] : null;
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
    document =
        json['document'] != null ? Document.fromJson(json['document']) : null;
    caption = json['caption'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data =  <String, dynamic>{};
//   data['message_id'] = messageId;
//   if (this.from != null) {
//     data['from'] = this.from!.toJson();
//   }
//   if (this.chat != null) {
//     data['chat'] = this.chat!.toJson();
//   }
//   data['date'] = this.date;
//   if (this.document != null) {
//     data['document'] = this.document!.toJson();
//   }
//   data['caption'] = this.caption;
//   return data;
// }
}
