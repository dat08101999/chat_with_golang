import 'package:chat_with_golang/common/appbar.dart';
import 'package:chat_with_golang/common/loading.dart';
import 'package:chat_with_golang/list_chat/list_chat_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conversation_widget.dart';
import 'list_conversation_controller.dart';

class ListConversation extends StatefulWidget {
  ListConversation({Key? key}) : super(key: key);

  @override
  State<ListConversation> createState() => _ListConversationState();
}

class _ListConversationState extends State<ListConversation>
    with TickerProviderStateMixin {
  ListConversationController listConversationController =
      Get.put(ListConversationController());

  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarCommon(
            listConversationController.name.value + "'s conversation"),
        body: Column(children: [
          Container(
            height: 10,
          ),
          TabBar(
            tabs: [tabar("Chat"), tabar("online"), tabar("offline")],
            controller: tabController,
          ),
          Visibility(
              visible: listConversationController.isLoading.value,
              child: const Expanded(child: Loading())),
          Visibility(
            visible: !listConversationController.isLoading.value,
            child: Expanded(
              child: TabBarView(
                children: [buildChat(context), Column(), Column()],
                controller: tabController,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildChat(context) {
    return Column(
        children: List.generate(
            listConversationController.listConversation.length,
            (index) => InkWell(
                  onTap: () {
                    Get.to(() => ListChatView(),
                        arguments:
                            listConversationController.listConversation[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                      ),
                      ConversationWidget(
                        name: listConversationController.getConversationNane(
                            listConversationController.listConversation[index]),
                      ),
                    ],
                  ),
                )));
  }

  Widget tabar(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.black),
    );
  }
}
