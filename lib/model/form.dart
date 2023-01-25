
class From {
  int? id;
  bool? isBot;
  String? firstName;
  String? lastName;
  String? username;
  String? languageCode;

  From(
      {this.id,
        this.isBot,
        this.firstName,
        this.lastName,
        this.username,
        this.languageCode});

  From.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isBot = json['is_bot'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    languageCode = json['language_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_bot'] = this.isBot;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['language_code'] = this.languageCode;
    return data;
  }
}