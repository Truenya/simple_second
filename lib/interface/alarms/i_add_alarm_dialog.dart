import 'package:flutter/material.dart';

class DialogAddAlarm extends StatelessWidget {
  const DialogAddAlarm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late TextEditingController _textFieldController = TextEditingController();
    return AlertDialog(
      title: const Text('TextField in Dialog'),
      content: TextField(
        onChanged: (value) {},
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: "Text Field in Dialog"),
      ),
    );
  }
}
