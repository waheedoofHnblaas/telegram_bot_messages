class Chat {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? type;

  Chat({this.id, this.firstName, this.lastName, this.username, this.type});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['type'] = this.type;
    return data;
  }
}
