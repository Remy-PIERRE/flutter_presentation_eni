import 'package:flutter/material.dart';

class PlaylistVideo extends StatelessWidget {

  final Map video;

  const PlaylistVideo({ 
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/video",
          arguments: {
            "videoId": "DUXNorZWQiI",
          }
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.play_arrow,
                size: 20.0,
                color: Colors.black,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  video["name"],
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              Text(
                video["duration"] == "" ?
                "00:00" :
                video["duration"],
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Color(0xff666666),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}