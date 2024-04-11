import "package:flutter/material.dart";

class NewerVideo extends StatelessWidget {

  final Map video;

  const NewerVideo({ 
    Key? key,
    required this.video, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context){

    print("Video : $video");

    // TODO - InkWell => video_page //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "La dernière publication",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF192963),            
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Image(
          image: video["image"].isEmpty ?
          AssetImage("/images/image_dummy.jpg") :
          AssetImage("/images/${video["image"]}"),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}