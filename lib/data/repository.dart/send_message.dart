import 'package:chat_with_golang/data/request.dart';

class SendMessageRepository {
  Future<bool> sendMessage(String useID, dynamic data) async {
    try {
      Request request = Request();
      var response = await request.requestApi(
          data: data, method: MethodType.POST, url: urlSendMessage + useID);
      if (response is ErrorModel) {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
    return true;
  }
}
