import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:eni_service_presentation_v2/components/loading.dart";
import "package:eni_service_presentation_v2/pages/home/components/category_videos.dart";
import "package:eni_service_presentation_v2/pages/home/components/newer_video.dart";
import "package:eni_service_presentation_v2/providers/video/videos_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomePage extends StatelessWidget {
const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppBarCustom(),
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
            child: HomePageContent()
          ),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<VideosProvider>(
      builder: (context, _videosProvider, chid) {

        if (_videosProvider.isGettingdata()) {
          return const Loading();
        }

        else if (!_videosProvider.hasData()) {
          return const Center(
            child: Text(
              "Problème de chargement des données, veuillez réessayer ultérieurement.",
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff333333),
              ),
            ),
          );
        }

        return Column(
          children: [
            NewerVideo(video: _videosProvider.getNewerVideo()),
            CategoryVideos(
              category: {"id": 0, "name": "Nouveautés"},
              videos: _videosProvider.getNewVideos(),
            ),
            for (Map category in _videosProvider.getCategories())
              if (!_videosProvider.getVideosByCategoryId(category["id"]).isEmpty)
                CategoryVideos(
                  category: category,
                  videos: _videosProvider.getVideosByCategoryId(category["id"]),
                )
          ],
        );
      },
    );
  }
}