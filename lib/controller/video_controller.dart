import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoController;
  String imageUrl = '';
  late Future<void> initializeVideoPlayerFuture;

  // VideoController(String url) {
  //   imageUrl = url;
  //   videoController = VideoPlayerController.network(imageUrl);
  //   initializeVideoPlayerFuture =  videoController.initialize();
  //   update();
  // }

  play() {
    videoController.value.isPlaying
        ? videoController.pause()
        : videoController.play();
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
