import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart";

class VideosProvider extends ChangeNotifier {

  final String url = "/assets/json";
  bool loading = true;
  List<Map> categories = [];
  List<Map> playlists = [];
  List<Map> videos = [];

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

  List<Map> getCategories() {
    return categories;
  }

  Map getNewerVideo() {
    return videos[0];
  }

  List<Map> getNewVideos() {
    return [
      videos[1],
      videos[2],
    ];
  }
    
  List<Map> getVideosByCategoryId(int categoryId) {
    List<Map> videosSelected = [];

    for (Map video in videos) {
      Map playlist = playlists.firstWhere((element) => element["id"] == video["playlist_id"],
        orElse: () => {});

      if (playlist.containsKey("category_id") && playlist["category_id"] == categoryId) {
        videosSelected.add(video);
      }
    }

    return videosSelected;
  }
}