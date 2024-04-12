import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:eni_service_presentation_v2/components/loading.dart";
import "package:eni_service_presentation_v2/providers/video/videos_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CategoryPage extends StatelessWidget {
const CategoryPage({ Key? key }) : super(key: key);

  @override
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
            child: Consumer<VideosProvider>(
              builder: (context, _videosProvider, child) {

                Map category = _videosProvider.getCategorySelected();
                List<Map> playlists = _videosProvider.getPlaylistsByCategoryId(category["id"]);

                if (category.isEmpty) {
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });

                  return const Loading();
                }                

                return Column(
                  children: [
                    Text(
                      category["name"],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF192963),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (Map playlist in playlists)
                          Container(
                            child: Image(
                              image: AssetImage("assets/images/image_dummy.jpg"),
                            ),
                          ),
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