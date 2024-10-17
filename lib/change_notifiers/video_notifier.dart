import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

VideoNotifier videoNotifier = VideoNotifier();
var videoPlayerController =
    CachedVideoPlayerController.asset("assets/pcg-video.mp4");

late CustomVideoPlayerController customVideoPlayerController;

class VideoNotifier extends ChangeNotifier {
  bool isVideoInitialised = false;

  videoIsInitialised(bool value) {
    isVideoInitialised = value;
    notifyListeners();
  }

  initialiseVideoController(BuildContext context) async {
    await videoPlayerController.initialize();
    videoPlayerController.pause();
    if (context.mounted) {
      customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: videoPlayerController,
          customVideoPlayerSettings: const CustomVideoPlayerSettings(
              showDurationPlayed: false,
              showDurationRemaining: false,
              settingsButtonAvailable: false,
              playbackSpeedButtonAvailable: false));
      customVideoPlayerController.videoPlayerController.setVolume(0.7);
      videoNotifier.videoIsInitialised(true);
    }
  }
}
