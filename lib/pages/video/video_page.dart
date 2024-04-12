import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:eni_service_presentation_v2/components/loading.dart";
import "package:flutter/material.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

class VideoPage extends StatelessWidget {
  VideoPage({ Key? key }) : super(key: key);

  final _controller = YoutubePlayerController();

  @override
  Widget build(BuildContext context) {

    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?; 
    // print("Arguments: $arguments");

    // if (videoState == "loading") {
    if(arguments == null) {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
      });

      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Loading(),
        ),
      );
    }

    // if (videoState == "error") {
    if (!arguments.keys.contains("videoId")) {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
      });

      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Loading(),
        ),
      );
    }

    _controller.loadVideoById(videoId: arguments["videoId"]);

    return YoutubePlayer( 
      controller: _controller, 
      aspectRatio: 16 / 9, 
    );
  }
}