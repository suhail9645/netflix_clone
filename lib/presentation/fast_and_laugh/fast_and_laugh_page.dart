import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_and_laugh/widget/video_list.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    List videoUrl=[
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
];
    return Scaffold(
        body: SafeArea(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          videoUrl.length,
          (index) => VideoListItem(
            index: index, videoUrl: videoUrl[index],
          ),
        ),
      ),
    ));
  }
}
