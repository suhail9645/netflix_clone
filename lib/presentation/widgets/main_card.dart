import 'package:flutter/material.dart';

import '../../core/const_widget.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key, required this.imageUrl,
  });
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 106,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500$imageUrl'))),
      ),
    );
  }
}
