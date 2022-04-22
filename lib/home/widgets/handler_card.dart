import 'package:flutter/material.dart';

class HandlerCard extends StatelessWidget {
  const HandlerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Icon(
        Icons.drag_handle,
        color: Colors.grey,
      ),
    );
  }
}
