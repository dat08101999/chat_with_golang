class Conversation {
  String? id;
  String? name;
  List<String>? listUser;

  Conversation({this.id, this.name, this.listUser});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    listUser = json['List_user'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['List_user'] = this.listUser;
    return data;
  }
}
