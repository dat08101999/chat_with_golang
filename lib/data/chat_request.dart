class ChatRequest {
  String? to;
  String? from;
  String? message;
  String? conversationId;

  ChatRequest({this.to, this.from, this.message, this.conversationId});

  ChatRequest.fromJson(Map<String, dynamic> json) {
    to = json['To'];
    from = json['From'];
    message = json['Message'];
    conversationId = json['ConversationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['To'] = this.to;
    data['From'] = this.from;
    data['Message'] = this.message;
    data['ConversationId'] = this.conversationId;
    return data;
  }
}
