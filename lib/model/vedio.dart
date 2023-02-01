class Video {
  int? duration;
  int? width;
  int? height;
  String? mimeType;
  Thumb? thumb;
  String? fileId;
  String? fileUniqueId;
  int? fileSize;

  Video(
      {this.duration,
        this.width,
        this.height,
        this.mimeType,
        this.thumb,
        this.fileId,
        this.fileUniqueId,
        this.fileSize});

  Video.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    thumb = json['thumb'] != null ? new Thumb.fromJson(json['thumb']) : null;
    fileId = json['file_id'];
    fileUniqueId = json['file_unique_id'];
    fileSize = json['file_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime_type'] = this.mimeType;
    if (this.thumb != null) {
      data['thumb'] = this.thumb!.toJson();
    }
    data['file_id'] = this.fileId;
    data['file_unique_id'] = this.fileUniqueId;
    data['file_size'] = this.fileSize;
    return data;
  }
}

class Thumb {
  String? fileId;
  String? fileUniqueId;
  int? fileSize;
  int? width;
  int? height;

  Thumb(
      {this.fileId, this.fileUniqueId, this.fileSize, this.width, this.height});

  Thumb.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    fileUniqueId = json['file_unique_id'];
    fileSize = json['file_size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_id'] = this.fileId;
    data['file_unique_id'] = this.fileUniqueId;
    data['file_size'] = this.fileSize;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}