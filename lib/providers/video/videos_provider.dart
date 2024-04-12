import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart";

class VideosProvider extends ChangeNotifier {

  final String url = "/assets/json";
  bool loading = true;
  List<Map> categories = [];
  List<Map> playlists = [];
  List<Map> videos = [];
  int? categorySelected;
  int? playlistSelected;

  VideosProvider() {
    setupData();
  }

  Future<void>setupData() async{
    await Future.wait([
      // TODO - refacto ? //
      setupCategories(),
      setupPlaylists(),
      setupVideos(),
      // mimick http request on DB //
      Future.delayed(const Duration(seconds: 1)),
    ]);

    loading = false;
    notifyListeners();
  }

  Future<void> setupCategories() async{
    try {
      Response response = await get(Uri.parse("$url/categories.json"));
      List data = jsonDecode(utf8.decode(response.bodyBytes));

      for (Map category in data) {
        categories.add(category);
      }
    } catch (error) {
      print("Error getting categories data !");
    }
  }

  Future<void> setupPlaylists() async{
    try {
      Response response = await get(Uri.parse("$url/playlists.json"));
      List data = jsonDecode(utf8.decode(response.bodyBytes));

      for (Map playlist in data) {
        playlists.add(playlist);
      }
    } catch (error) {
      print("Error getting playlists data !");
    }
  }

  Future<void> setupVideos() async{
    try {
      Response response = await get(Uri.parse("$url/videos.json"));
      List data = jsonDecode(utf8.decode(response.bodyBytes));

      for (Map video in data) {
        videos.add(video);
      }
    } catch (error) {
      print("Error getting videos data !");
    }
  }   

  bool isGettingdata() {
    return loading;
  }

  bool hasData() {
    return (
      videos.isEmpty ||
      playlists.isEmpty || 
      categories.isEmpty
    ) ? false : true;    
  }

  void setCategorySelected(int categoryId) {
    categorySelected = categoryId;

    notifyListeners();
  }

  List<Map> getCategories() {
    return categories;
  }

  Map getCategorySelected() {
    return categories.firstWhere((category) => 
      category["id"] == categorySelected,
      orElse: () => {
        "id": 1,
        "name": "JavaScript"
      }
    );
  }

  void setPlaylistSelected(int playlistId) {
    playlistSelected = playlistId;

    notifyListeners();
  }

  Map getPlaylistSelected() {
    return playlists.firstWhere((playlist) => 
      playlist["id"] == playlistSelected,
      orElse: () => {
        "id": 10,
        "name": "JavaScript de A à Z",
        "image": "",
        "description": "Découvrez le langage de programmation JavaScript sous tous ses angles avec cette playlist complète. Des bases fondamentales aux concepts avancés, chaque vidéo vous guidera à travers les aspects essentiels de JavaScript. Explorez les boucles, les fonctions, les objets, la manipulation du DOM, les événements, et bien plus encore. Que vous soyez débutant ou développeur expérimenté, cette série vous permettra de maîtriser JavaScript de manière exhaustive, vous donnant les compétences nécessaires pour créer des applications web dynamiques et interactives. Plongez dans l'univers de JavaScript et développez votre expertise pas à pas.",
        "category_id": 1
      }
    );
  }
  
  Map getNewerVideo() {
    return videos[0];
  }

  List<Map> getNewPlaylists() {
    return [
      playlists[1],
      playlists[2],
    ];
  }
    
  List<Map> getPlaylistsByCategoryId(int categoryId) {
    List<Map> playlistsSelected = [];

    for (Map playlist in playlists) {
      if (playlist["category_id"] == categoryId) {
        playlistsSelected.add(playlist);
      }
    }    

    return playlistsSelected;
  }

  List<Map> getVideosByPlaylistId(int playlistId) {
    return videos.where((video) => video["playlist_id"] == playlistId).toList();      
  }
}