import 'package:equatable/equatable.dart';
import 'package:velea_v2/entities/song_maker_step.dart';


import 'song_selected.dart';

class RoomMusic extends Equatable {
  
  final List<SongSelected> listAlbums;
  final List<SongSelected> listSongs;
  final List<SongSelected> readySong;

  const RoomMusic({
    required this.listAlbums,
    required this.listSongs,
    required this.readySong,
  });

  factory RoomMusic.fromSongSelected(List<SongSelected> songSelected) {
    final listAlbums = songSelected.where((o) => o.songMakerStep == SongMakerStep.album).toList();
    final listSongs = songSelected.where((o) => o.songMakerStep == SongMakerStep.addSong).toList();
    final readySong = songSelected.where((o) => o.songMakerStep == SongMakerStep.readySong).toList();
    
    return RoomMusic(listAlbums: listAlbums, listSongs: listSongs, readySong: readySong);
  }

  
  List<SongSelected> get allSongs => [
    ...listAlbums,
    ...listSongs,
    ...readySong,
  ];

  @override
  List<Object?> get props => [listAlbums, listSongs, readySong];

  int countForStep(SongMakerStep step) {
    switch (step) {
      case SongMakerStep.album:
        return listAlbums.length;
      case SongMakerStep.addSong:
        return listSongs.length;
      case SongMakerStep.readySong:
        return readySong.length;
    }
  }

}