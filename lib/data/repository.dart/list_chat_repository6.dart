import 'package:chat_with_golang/data/request.dart';
import 'package:chat_with_golang/models/list_chat_model.dart';

class ListChatRepo {
  Future<List<ListChatRepo>> getListChat(
      String id, int page, int perpage) async {
    Request request = Request();
    List<ListChatRepo> list = [];

    return list;
  }
}
