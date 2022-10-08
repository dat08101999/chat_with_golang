import 'package:flutter/material.dart';

appbarCommon(String title) {
  return AppBar(
    leading: CircleAvatarCustom(text: title[0].toUpperCase()),
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    centerTitle: false,
  );
}

class CircleAvatarCustom extends StatelessWidget {
  const CircleAvatarCustom({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 40,
        width: 40,
        child: Center(
            child: Text(
          text ?? "N",
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), border: Border.all()),
      ),
    );
  }
}
