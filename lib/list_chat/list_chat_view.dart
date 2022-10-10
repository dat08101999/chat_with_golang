import 'package:chat_with_golang/common/appbar.dart';
import 'package:chat_with_golang/common/loading.dart';
import 'package:chat_with_golang/common/tap_to_unfocus.dart';
import 'package:chat_with_golang/list_chat/list_chat_controller.dart';
import 'package:chat_with_golang/list_conversation/list_conversation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChatView extends StatefulWidget {
  ListChatView({Key? key}) : super(key: key);

  @override
  State<ListChatView> createState() => _ListChatViewState();
}

class _ListChatViewState extends State<ListChatView> {
  ListChatController listChatControlle = Get.put(ListChatController());
  TextEditingController textEditingController = TextEditingController();
  ListConversationController listConversationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TapToUnfocus(
        child: Scaffold(
          appBar: appbarCommon(ListConversationController()
              .getConversationNane(listChatControlle.conversation)),
          backgroundColor: Colors.white,
          body: listChatControlle.isLoading.value
              ? Loading()
              : Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: listChatControlle.listChatMessage.length,
                            itemBuilder: (context, index) {
                              return yourMessage(
                                  listChatControlle
                                          .listChatMessage[index].content ??
                                      "",
                                  listConversationController.name.value ==
                                      listChatControlle
                                          .listChatMessage[index].from);
                            }),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green[100],
                          child: textField()),

                      // textField()
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget textField() {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          Flexible(
            child: TextField(
              decoration: InputDecoration(),
              maxLines: 5,
              minLines: 1,
              controller: textEditingController,
            ),
          ),
          // ),
          InkWell(
            onTap: () {
              listChatControlle.sendMessage(textEditingController.text);
              textEditingController.clear();
            },
            child: const Text(
              "Send",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget yourMessage(String content, bool isYour) {
    return Row(
      mainAxisAlignment:
          isYour ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isYour ? Colors.blue : Colors.green[100],
          ),
          child: Text(content),
        )
      ],
    );
  }

  Widget guestMessage() {
    return Container();
  }
}
