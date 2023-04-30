import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoLink;

  const CustomVideoPlayer({
    required this.videoLink,
    Key? key
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.videoLink).toString(),
     flags: const YoutubePlayerFlags(
      autoPlay: false,

     ));
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       YoutubePlayer(
                  controller:controller,
                  showVideoProgressIndicator: true,
                   ),
       
      ],
    );
  }
}
