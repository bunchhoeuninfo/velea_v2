
import 'package:velea_v2/models/album.dart';

class Song {

  final String id;
  final Album album;
  final String songName;
  final String songTitle;
  final String songUrl;
  final String langCd;

  const Song({
    required this.id,
    required this.album,
    required this.songName,
    required this.songTitle,
    required this.songUrl,
    required this.langCd,
  });
  

}