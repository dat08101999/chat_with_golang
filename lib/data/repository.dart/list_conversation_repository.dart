import 'package:chat_with_golang/data/request.dart';
import 'package:chat_with_golang/models/conversation.dart';

class ListConversationRepository {
  Future<List<Conversation>> getListConversation(String name) async {
    Request request = Request();
    List<Conversation> list = [];
    try {
      var response = await request.requestApi(
          method: MethodType.GET, url: urlGetAllChatRoom + name);
      if (response is ErrorModel) {
        print(response.message);
        return list;
      } else {
        print(response);
        ((response as Map<String, dynamic>)["chat_room"] as List)
            .forEach((element) {
          list.add(Conversation.fromJson(element));
        });
      }
    } catch (err, trace) {
      print(trace.toString());
    }
    return list;
  }
}
