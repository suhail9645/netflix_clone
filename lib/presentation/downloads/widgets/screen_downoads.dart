import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/home/functions/functions.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import '../../../core/const_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List widgetList = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: AppBarWidget(
              title: 'Download',
            )),
        body: SafeArea(
            child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => widgetList[index],
          itemCount: widgetList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        )));
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        boxForSpace,
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        boxForSpace,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.image,
    required this.angle,
    required this.margin,
    required this.size,
  });

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage( 'https://image.tmdb.org/t/p/w500$image'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    
    HomeFunction.comingSoon[0].posterPath,HomeFunction.nowPlaying[0].posterPath,HomeFunction.topRated[0].posterPath
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads For You',
          style: TextStyle(
              color: kwhite, fontSize: 21, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Text(
          'We will download a personalised selection of\nmovies and shows for you.so there is\nalwaays something to watch on your\n device',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: size.width,
          height: size.width - 20,
          child: Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              radius: size.width * 0.37,
              backgroundColor: const Color.fromARGB(255, 106, 103, 103),
            ),
            DownloadsImageWidget(
              image: imageList[0],
              angle: 20,
              margin: const EdgeInsets.only(left: 140, bottom: 50),
              size: Size(size.width * 0.39, size.height * 0.27),
            ),
            DownloadsImageWidget(
              image: imageList[1],
              angle: -20,
              margin: const EdgeInsets.only(right: 140, bottom: 50),
              size: Size(size.width * 0.39, size.height * 0.27),
            ),
            DownloadsImageWidget(
              image: imageList[2],
              angle: 0,
              margin: const EdgeInsets.only(left: 0),
              size: Size(size.width * 0.39, size.height * 0.31),
            )
          ]),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: kButtonblue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: kwhite,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                  color: kButtonblack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
