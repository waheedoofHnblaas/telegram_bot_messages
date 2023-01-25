

class Thumba {
  String? fileId;
  String? fileUniqueId;
  int? fileSize;
  int? width;
  int? height;

  Thumba(
      {this.fileId, this.fileUniqueId, this.fileSize, this.width, this.height});

  Thumba.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    fileUniqueId = json['file_unique_id'];
    fileSize = json['file_size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_id'] = fileId;
    data['file_unique_id'] = fileUniqueId;
    data['file_size'] = fileSize;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}