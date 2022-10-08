class ListChatModel {
  String? id;
  String? conversationId;
  String? createAt;
  String? from;
  String? content;

  ListChatModel(
      {this.id, this.conversationId, this.createAt, this.from, this.content});

  ListChatModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    conversationId = json['ConversationId'];
    createAt = json['CreateAt'];
    from = json['From'];
    content = json['Content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ConversationId'] = this.conversationId;
    data['CreateAt'] = this.createAt;
    data['From'] = this.from;
    data['Content'] = this.content;
    return data;
  }
}
