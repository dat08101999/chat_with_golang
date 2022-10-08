import 'package:chat_with_golang/data/repository.dart/list_conversation_repository.dart';
import 'package:chat_with_golang/models/conversation.dart';
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
    connectSocket();
    print(name.value);
    getListConversation();
    super.onInit();
  }

  connectSocket() {
    print("object");
    if (chanel == null) {
      chanel = WebSocketChannel.connect(Uri.parse(webSkUrl + name.value));
      chanel?.stream.listen((event) {
        print(event);
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
      if (element != this.name) {
        name = element;
      }
    });
    return name;
  }
}
