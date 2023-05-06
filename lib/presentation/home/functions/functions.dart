import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/models/pages/pages.dart';
import 'package:netflix/models/trending/trending.dart';
import '../../../core/strings.dart';
class HomeFunction{
  static List<Movies>trending=[];
  static List<Movies>comingSoon=[];
   static List<Movies>nowPlaying=[];
  static List<Movies>topRated=[];
  static String image='';
  static Future<void>getTrending()async{
    try{
    final response = await http.get(Uri.parse(
          trendingUrl));
          if(response.statusCode==200){
             Map<String, dynamic> data = jsonDecode(response.body);
             Pages pages=Pages.fromJson(data);    
             image=pages.results![5].posterPath!; 
             trending=pages.results!;        
          }
    }catch(e){
      print(e);
    }
  }
  static Future<void>getComingSoon()async{
    try{
    final response = await http.get(Uri.parse(
          comingSoonUrl));
          if(response.statusCode==200){
             Map<String, dynamic> data = jsonDecode(response.body);
             Pages pages=Pages.fromJson(data);    
             image=pages.results![5].posterPath!; 
             comingSoon=pages.results!;        
          }
    }catch(e){
      print(e);
    }
  }
  static Future<void>getNowPlaying()async{
    try{
    final response = await http.get(Uri.parse(
         nowPlayingUrl));
          if(response.statusCode==200){
             Map<String, dynamic> data = jsonDecode(response.body);
             Pages pages=Pages.fromJson(data);    
             image=pages.results![5].posterPath!; 
             nowPlaying=pages.results!;        
          }
    }catch(e){
      print(e);
    }
  }
  static Future<void>gettopRated()async{
    try{
    final response = await http.get(Uri.parse(
          topRatedUrl));
          if(response.statusCode==200){
             Map<String, dynamic> data = jsonDecode(response.body);
             Pages pages=Pages.fromJson(data);    
             image=pages.results![5].posterPath!; 
             topRated=pages.results!;        
          }
    }catch(e){
      print(e);
    }
  }
}