import 'package:flutter/widgets.dart';
import 'package:netflix/core/const_widget.dart';
import 'package:netflix/presentation/search/function/function.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w440_and_h660_face/rM5Y0ziZbmpkqW1db2HK3xrzTXj.jpg';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & Tv'),
        boxForSpaceHeight,
       ValueListenableBuilder(valueListenable: SearchFunction.searchData, builder:(context, value, child) {
         return  Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1 / 1.4,
          children: List.generate(value.length, (index) =>  MainCard(image: value[index].posterPath??'https://www.themoviedb.org/t/p/w440_and_h660_face/rM5Y0ziZbmpkqW1db2HK3xrzTXj.jpg',)),
        ),);
       },)
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(5)),
        image:
            DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500$image'), fit: BoxFit.cover),
      ),
    );
  }
}
