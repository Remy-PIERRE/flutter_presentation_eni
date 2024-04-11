import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';

class CategoryVideos extends StatelessWidget {

  final Map category;
  final List<Map> videos;

  const CategoryVideos({ 
    Key? key,
    required this.category,
    required this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category["name"],
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF192963),            
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          items: videos.map((video) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      video["name"],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}