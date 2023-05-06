import 'package:flutter/material.dart';
import 'package:netflix/models/trending/trending.dart';
import 'package:netflix/presentation/home/functions/functions.dart';

import '../../../core/colors.dart';
import '../../../core/const_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
    required this.movies,
  });
  final Movies movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boxForSpaceHeight,
        Text(
          movies.title ?? 'unknown',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          movies.overview ?? 'Unknown',
          style:const TextStyle(color: kgrey),
        ),
        boxForSpace20,
        VideoWidget(
          image: movies.backdropPath!,
        ),
        boxForSpaceHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              icon: Icons.share,
              text: 'Share',
              size: 25,
              textSize: 12,
            ),
            boxForSpace,
            CustomButton(
              icon: Icons.add,
              text: 'Add',
              size: 25,
              textSize: 12,
            ),
            boxForSpace,
            CustomButton(
              icon: Icons.play_arrow_outlined,
              text: 'Play',
              size: 25,
              textSize: 12,
            ),
            boxForSpace,
          ],
        )
      ],
    );
  }
}
