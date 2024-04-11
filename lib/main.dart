import 'package:eni_service_presentation_v2/pages/home/home_page.dart';
import 'package:eni_service_presentation_v2/pages/playlist/playlist_page.dart';
import 'package:eni_service_presentation_v2/pages/theme/theme_page.dart';
import 'package:eni_service_presentation_v2/pages/video/video_page.dart';
import 'package:eni_service_presentation_v2/providers/video/videos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => ThemesProvider(),
        //   ),
        ChangeNotifierProvider(
          create: (context) => VideosProvider(),
          )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eni Service Démo',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/theme": (context) => const ThemePage(),
        "/playlist": (context) => const PlaylistPage(),
        "/video": (context) => const VideoPage(), 
      },
    );
  }
}

