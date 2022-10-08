import 'package:flutter/material.dart';

import '../common/appbar.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({Key? key, this.name}) : super(key: key);
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: EdgeInsets.all(10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatarCustom(text: name?[0]),
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Sd")
            ],
          ),
        )
      ]),
    );
  }
}
