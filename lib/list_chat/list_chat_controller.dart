import 'package:chat_with_golang/data/chat_request.dart';
import 'package:chat_with_golang/data/repository.dart/list_chat_repository6.dart';
import 'package:chat_with_golang/data/repository.dart/send_message.dart';
import 'package:chat_with_golang/list_conversation/list_conversation_controller.dart';
import 'package:chat_with_golang/models/conversation.dart';
import 'package:chat_with_golang/models/list_chat_model.dart';
import 'package:get/get.dart';

class ListChatController extends GetxController {
  late Conversation conversation;
  RxList<ListChatModel> listChatMessage = <ListChatModel>[].obs;
  int page = 1;
  int perpage = 30;
  RxBool isLoading = false.obs;
  RxBool isLoadmore = false.obs;
  @override
  void onInit() {
    conversation = Get.arguments;
    print(conversation.toJson());
    getListChatMessage();
    print(listChatMessage.value);
    // TODO: implement onInit
    super.onInit();
  }

  getListChatMessage() async {
    isLoading.value = true;
    listChatMessage.value =
        await ListChatRepo().getListChat(conversation.id ?? "", page, perpage);
    isLoading.value = false;
  }

  loadMoreMessage() async {
    page++;
    isLoadmore.value = true;
    listChatMessage.addAll(
        await ListChatRepo().getListChat(conversation.id ?? '', page, perpage));
    isLoadmore.value = false;
  }

  sendMessage(String message) async {
    var controllerConversation = Get.find<ListConversationController>();
    var chatModelRequest = ChatRequest(
        to: controllerConversation.getConversationNane(conversation),
        from: controllerConversation.name.value,
        conversationId: conversation.id,
        message: message);
    listChatMessage.insert(
        0,
        ListChatModel(
            from: chatModelRequest.from, content: message, id: "Temp"));
    SendMessageRepository().sendMessage(
        controllerConversation.name.value, chatModelRequest.toJson());
  }
}
