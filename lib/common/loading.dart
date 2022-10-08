import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
            child: Image.asset(
      "images/hotdog.gif",
      fit: BoxFit.fill,
      width: 150,
      height: 150,
    )));
  }
}
