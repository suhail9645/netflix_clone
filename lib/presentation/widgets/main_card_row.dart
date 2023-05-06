import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/functions/functions.dart';

import '../../core/const_widget.dart';
import '../../models/trending/trending.dart';
import 'main_card.dart';
import 'main_title.dart';

class CardRow extends StatelessWidget {
  const CardRow({super.key, required this.title, required this.category});
  final String title;
  final List<Movies>category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: MainTitle(title: title),
        ),
        boxForSpace,
        LimitedBox(
          maxHeight: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(HomeFunction.trending.length, (index) =>  MainCard(imageUrl: category[index].posterPath!,)),
          ),
        )
      ],
    );
  }
}
