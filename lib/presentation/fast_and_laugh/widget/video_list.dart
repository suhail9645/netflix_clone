import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({super.key, required this.index, required this.videoUrl});
  final int index;
  final String videoUrl;
  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  bool isMuted=false;
  @override
  void initState() {
    
    _controller = VideoPlayerController.network(
        widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              :const Center(child: CircularProgressIndicator(),),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                         setState(() {
                           _controller.setVolume(1);
                         });
                    },
                    icon: const Icon(
                      Icons.volume_off,
                      size: 28,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                const    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://www.themoviedb.org/t/p/w440_and_h660_face/3BSxAjiporlwQTWzaHZ9Yrl5C9D.jpg'),
                      ),
                    ),
                  const  VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                  const  VideoActions(icon: Icons.add, title: 'My List'),
                  const  VideoActions(icon: Icons.share, title: 'Share'),
                    GestureDetector(onTap: () {
                       setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
                  
            });
                    }, child: VideoActions(icon:_controller.value.isPlaying? Icons.pause: Icons.play_arrow, title:_controller.value.isPlaying? 'Pause':'play')),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
   @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoActions extends StatelessWidget {
  const VideoActions({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
