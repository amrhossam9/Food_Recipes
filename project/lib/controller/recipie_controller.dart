import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class HomeController extends GetxController {
  
  String videoId = "";
  void setVideoId({required String videoLink})
  {
    videoId=YoutubePlayer.convertUrlToId(videoLink)!;
  }

  
}