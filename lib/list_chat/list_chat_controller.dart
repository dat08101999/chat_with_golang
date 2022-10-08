import 'package:chat_with_golang/models/conversation.dart';
import 'package:get/get.dart';

class ListChatController extends GetxController {
  late Conversation conversation;

  @override
  void onInit() {
    conversation = Get.arguments;
    print(conversation.toJson());
    // TODO: implement onInit
    super.onInit();
  }
  // getL
}
