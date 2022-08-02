import 'package:flutter/material.dart';

class FadedText extends StatelessWidget {
  const FadedText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      softWrap: true,
      maxLines: 1,
    );
  }
}
