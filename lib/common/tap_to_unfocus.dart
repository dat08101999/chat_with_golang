import 'package:flutter/material.dart';

class TapToUnfocus extends StatelessWidget {
  const TapToUnfocus({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
