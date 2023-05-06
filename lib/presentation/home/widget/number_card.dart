import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
              height: 150,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w440_and_h660_face/M1q0HuyRnqxP8Si54srsPREFIH.jpg'))),
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 4,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 105,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            )),
      ],
    );
  }
}
