import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:flutter/material.dart";

class PlaylistPage extends StatelessWidget {
const PlaylistPage({ Key? key }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarCustom(),
      body: Container(
        child: Center(
          child: Text(
            "Home Page"
          ),
        ),
      ),
    );
  }
}