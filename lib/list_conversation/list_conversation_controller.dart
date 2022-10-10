import 'dart:convert';
import 'dart:math';

import 'package:chat_with_golang/data/repository.dart/list_conversation_repository.dart';
import 'package:chat_with_golang/list_chat/list_chat_controller.dart';
import 'package:chat_with_golang/models/conversation.dart';
import 'package:chat_with_golang/models/list_chat_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:get/get.dart';
import '../data/request.dart';

class ListConversationController extends GetxController {
  RxList listConversation = [].obs;
  static WebSocketChannel? chanel;
  RxString name = "".obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    name.value = Get.arguments;
    print(name.value);
    connectSocket();
    getListConversation();
    super.onInit();
  }

  connectSocket() {
    print("object");
    if (chanel == null) {
      chanel = WebSocketChannel.connect(Uri.parse(webSkUrl + name.value));
      print(chanel.toString());
      chanel?.stream.listen((event) {
        print(event.runtimeType);
        ;
        if (Get.isRegistered<ListChatController>()) {
          var ss = json.decode(event);
          var chatCon = Get.find<ListChatController>();
          var chatMode = ListChatModel.fromJson(ss);
          if (chatMode.conversationId == chatCon.conversation.id &&
              chatMode.id != "Chat") {
            print("add");
            chatCon.listChatMessage.value
                .removeWhere((element) => element.id == "Temp");
            chatCon.listChatMessage.value
                .insert(0, ListChatModel.fromJson(json.decode(event)));
            chatCon.listChatMessage.refresh();
          }
        }
      });
    }
  }

  getListConversation() async {
    isLoading.value = true;
    listConversation.value =
        await ListConversationRepository().getListConversation(name.value);
    isLoading.value = false;
  }

  getConversationNane(Conversation conversation) {
    String name = "";
    conversation.listUser?.forEach((element) {
      if (element != this.name.value) {
        name = element;
      }
    });
    return name;
  }
}
