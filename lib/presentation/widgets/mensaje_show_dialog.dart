import 'package:flutter/material.dart';

class MensajeShowDialog extends StatelessWidget {
  final String title;
  final String message;

  const MensajeShowDialog({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => route),
            // );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}