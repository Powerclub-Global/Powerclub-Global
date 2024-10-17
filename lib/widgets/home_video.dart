import 'dart:developer';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/video_notifier.dart';

class HomeVideo extends StatefulWidget {
  final String videoUrl;

  const HomeVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<HomeVideo> createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  @override
  Widget build(BuildContext context) {
    !videoNotifier.isVideoInitialised
        ? videoNotifier.initialiseVideoController(context)
        : null;
    return ListenableBuilder(
        listenable: videoNotifier,
        builder: (BuildContext context, Widget? child) {
          log("printing is initialised value");
          log(videoNotifier.isVideoInitialised.toString());
          return videoNotifier.isVideoInitialised
              ? AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: CustomVideoPlayer(
                      customVideoPlayerController: customVideoPlayerController),
                )
              : const SizedBox(
                  height: 200, // Placeholder height
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
