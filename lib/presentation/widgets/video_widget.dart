import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500$image',
        fit: BoxFit.fill,
      ),
    );
  }
}
