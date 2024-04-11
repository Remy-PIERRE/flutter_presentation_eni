import "package:eni_service_presentation_v2/components/app_bar_custom.dart";
import "package:flutter/material.dart";

class ThemePage extends StatelessWidget {
const ThemePage({ Key? key }) : super(key: key);

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