import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downoads.dart';
import 'package:netflix/presentation/fast_and_laugh/fast_and_laugh_page.dart';
import 'package:netflix/presentation/home/home_page.dart';
import 'package:netflix/presentation/main_page/bottem_navigation_bar.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot_page.dart';
import 'package:netflix/presentation/search/search_page.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final List pages = [
    const ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottemNavigtionBarWidget(),
    );
  }
}
