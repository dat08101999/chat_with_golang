import 'package:chat_with_golang/data/repository.dart/list_chat_repository6.dart';
import 'package:chat_with_golang/models/conversation.dart';
import 'package:chat_with_golang/models/list_chat_model.dart';
import 'package:get/get.dart';

class ListChatController extends GetxController {
  late Conversation conversation;
  RxList<ListChatModel> listChatMessage = <ListChatModel>[].obs;
  int page = 1;
  int perpage = 10;
  RxBool isLoading = false.obs;
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
}
