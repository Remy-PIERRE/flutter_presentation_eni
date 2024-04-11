import "package:flutter/material.dart";

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
const AppBarCustom({ Key? key }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: const Color(0xFF192963),
      iconTheme: const IconThemeData(
        color: Colors.white
        ),
      title: const Text(
        "Eni Service",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}