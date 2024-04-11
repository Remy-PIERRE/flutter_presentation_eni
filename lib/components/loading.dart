import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatelessWidget {
const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Center(
      child: SpinKitFoldingCube(
        color: Color(0xFF192963),
        size: 50.0,
      ),
    );
  }
}