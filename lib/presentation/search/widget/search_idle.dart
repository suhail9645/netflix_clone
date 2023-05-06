import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/models/trending/trending.dart';
import 'package:netflix/presentation/home/functions/functions.dart';
import 'package:netflix/presentation/search/widget/title.dart';
import '../../../core/colors.dart';
import '../../../core/const_widget.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/xVFpOIVdVn5ZUq1QIf0UJcZWjO2.jpg';

class SearchIdle extends StatelessWidget {
    SearchIdle({super.key,});
final List<Movies>movie=HomeFunction.comingSoon+HomeFunction.nowPlaying;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Top Searches'),
        boxForSpaceHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>  TopSearchTile(movies:movie[index],),
              separatorBuilder: (context, index) => boxForSpace20,
              itemCount: movie.length),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key, required this.movies});
final Movies movies;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 60,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage('https://image.tmdb.org/t/p/w500${movies.posterPath}'))),
        ),
        boxForSpace,
         Expanded(
          child: Text(
            movies.title??'Unknown',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: backGroundColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        ),
      ],
    );
  }
}
