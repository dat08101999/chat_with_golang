import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_conversation/list.dart';

class NameEnter extends StatelessWidget {
  NameEnter({Key? key}) : super(key: key);
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _name,
            decoration: InputDecoration(hintText: "Nhập tên"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Get.off(() => ListConversation(), arguments: _name.text);
              },
              child: Text("OK"))
        ]),
      ),
    );
  }
}
