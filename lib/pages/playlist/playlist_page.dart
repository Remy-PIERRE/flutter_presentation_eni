import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:eni_service_presentation_v2/components/loading.dart";
import "package:eni_service_presentation_v2/pages/playlist/components/playlist_video.dart";
import "package:eni_service_presentation_v2/providers/video/videos_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class PlaylistPage extends StatelessWidget {
const PlaylistPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarCustom(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 60,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 28.0,
            ),
            child: Consumer<VideosProvider>(
              builder: (context, _videosProvider, child) {

                Map playlist = _videosProvider.getPlaylistSelected();
                List<Map> videos = _videosProvider.getVideosByPlaylistId(playlist["id"]);

                if (playlist.isEmpty) {
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });

                  return const Loading();
                }                

                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 100.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: AssetImage(
                                playlist["image"] == "" ?
                                "assets/images/image_dummy.jpg" :
                                "/assets/image/${playlist["image"]}",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  playlist["name"],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF192963),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      playlist["description"] == "" ?
                      "Une description de remplissage" :
                      playlist["description"],
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff333333),
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Column(
                      children: [
                        for (Map video in videos)
                          PlaylistVideo(video: video),
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}