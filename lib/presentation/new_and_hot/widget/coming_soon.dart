import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/models/trending/trending.dart';
import 'package:netflix/presentation/widgets/custom_button.dart';
import '../../../core/const_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.movie,
  });
  final Movies movie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 380,
          child: Column(
            children:  [
              Text(
                movie.releaseDate!,
                style:const TextStyle(
                  fontSize: 16,
                  color: kgrey,
                ),
              ),
            
            ],
          ),
        ),
        SizedBox(
         
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(image: movie.backdropPath!,),
              boxForSpaceHeight,
              Row(
                children: [
                  Text(
                    movie.title!,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.kaushanScript(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  const CustomButton(
                    icon: Icons.alarm,
                    text: 'Remind Me',
                    size: 20,
                    textSize: 11,
                  ),
                  boxForSpace,
                  const CustomButton(
                    icon: Icons.info_outline_rounded,
                    text: 'Info',
                    size: 20,
                    textSize: 11,
                  ),
                  boxForSpace
                ],
              ),
               Text('Coming on ${movie.releaseDate}'),
              boxForSpaceHeight,
              Text(
                movie.title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                movie.overview!,
                style: TextStyle(color: kgrey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
