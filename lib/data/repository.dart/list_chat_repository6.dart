import 'package:chat_with_golang/data/request.dart';
import 'package:chat_with_golang/models/list_chat_model.dart';

class ListChatRepo {
  Future<List<ListChatModel>> getListChat(
      String id, int page, int perpage) async {
    Request request = Request();
    List<ListChatModel> list = [];
    try {
      var response = await request.requestApi(
          method: MethodType.GET,
          url: urlGetAllMessageOfRoom +
              id +
              "/" +
              page.toString() +
              "/" +
              perpage.toString());
      if (response is ErrorModel) {
        print(response);
      } else {
        print(response);
        ((response as Map<String, dynamic>)["chat_room"] as List)
            .forEach((element) {
          list.add(ListChatModel.fromJson(element));
        });
      }
    } catch (ex) {
      print(ex);
    }
    return list;
  }
}
