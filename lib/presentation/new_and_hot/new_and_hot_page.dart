import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/home/functions/functions.dart';
import 'package:netflix/presentation/new_and_hot/function/function.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon.dart';
import '../../core/const_widget.dart';
import 'widget/everyone_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 27,
                ),
                boxForSpace,
                Container(
                  height: 27,
                  width: 27,
                  color: Colors.blue,
                ),
                boxForSpace,
              ],
              bottom: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: backGroundColor,
                  unselectedLabelColor: kwhite,
                  isScrollable: true,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  tabs: [
                    Tab(
                      text: '🍿 Coming soon',
                    ),
                    Tab(
                      text: '👀 Everyone Watching',
                    )
                  ]),
            ),
          ),
          body: TabBarView(
              children: [buildComingSoon(), buildEveryoneWatching()])),
    );
  }

  Widget buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children:  [boxForSpaceHeight, ComingSoonWidget(movie: HomeFunction.comingSoon[index],)],
      ),
    );
  }

  Widget buildEveryoneWatching() {
    return ListView.builder(
      itemBuilder: (context, index) =>  EveryoneWatching(movies: NewAndHotFunctions.discover[index],),
      itemCount: 10,
    );
  }
}
