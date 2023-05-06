import 'package:flutter/material.dart';
import '../../core/const_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        boxForSpace,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 27,
        ),
        boxForSpace,
        Container(
          height: 27,
          width: 27,
          color: Colors.blue,
        ),
        boxForSpace,
      ],
    );
  }
}
