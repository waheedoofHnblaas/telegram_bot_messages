import 'package:animations/model/thumba.dart';
import 'package:flutter/material.dart';

class Document {
  String? fileName;
  String? mimeType;
  Thumba? thumb;
  String? fileId;
  String? fileUniqueId;
  int? fileSize;

  Document(
      {this.fileName,
      this.mimeType,
      this.thumb,
      this.fileId,
      this.fileUniqueId,
      this.fileSize});

  Document.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    thumb = json['thumb'] != null ? Thumba.fromJson(json['thumb']) : null;
    fileId = json['file_id'];
    fileUniqueId = json['file_unique_id'];
    fileSize = json['file_size'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['file_name'] = this.fileName;
//   data['mime_type'] = this.mimeType;
//   if (this.thumb != null) {
//     data['thumb'] = this.thumb!.toJson();
//   }
//   data['file_id'] = this.fileId;
//   data['file_unique_id'] = this.fileUniqueId;
//   data['file_size'] = this.fileSize;
//   return data;
// }
}
