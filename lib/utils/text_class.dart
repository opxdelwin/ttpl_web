import 'package:flutter/material.dart';
import 'utils.dart';

_SecondaryText secondaryText({text}){
  return _SecondaryText(text: text);
}

class _SecondaryText extends StatelessWidget {
  const _SecondaryText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: body,
    );
  }
}
