
import 'package:flutter/material.dart';
import 'package:velea_v2/core_lib/wolt_responsive_layout_grid.dart';
import 'package:velea_v2/entities/room_music.dart';
import 'package:velea_v2/entities/song_selected.dart';

import '../entities/song_maker_step.dart';
import 'widgets/song_selected_list_widget.dart';

class MusicOnlineContent extends StatefulWidget {
  const MusicOnlineContent({super.key, 
    required RoomMusic roomMusic,
    required ValueNotifier<bool> isOnlineNotifier,
  }) : _isOnlineNotifier = isOnlineNotifier, _roomMusic = roomMusic;

  final RoomMusic _roomMusic;
  final ValueNotifier<bool> _isOnlineNotifier;

  State<MusicOnlineContent> createState() => _MusicOnlineContentState();
}

class _MusicOnlineContentState extends State<MusicOnlineContent> {
  late RoomMusic _roomMusic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _roomMusic = widget._roomMusic;
  }

  Map<SongMakerStep, SongSelectedListWidget> get _songMakerStepListWidget => {
    SongMakerStep.album: SongSelectedListWidget(
      songSelected: _roomMusic.listAlbums,
      songMakerStep: SongMakerStep.album,
      onSongSelected: (songSelectedId) {
        _onSongSelectedStatusChange(songSelectedId, SongMakerStep.album);
      },      
    ),

    SongMakerStep.addSong: SongSelectedListWidget(
      songSelected: _roomMusic.listSongs,
      songMakerStep: SongMakerStep.addSong,
      onSongSelected: (songSelectedId) {
        _onSongSelectedStatusChange(songSelectedId, SongMakerStep.readySong);
      },
    ),

    SongMakerStep.readySong: SongSelectedListWidget(
      songSelected: _roomMusic.readySong,
      songMakerStep: SongMakerStep.readySong,
      onSongSelected: _onSongSelectedStatusChange,
    )
  };

  @override
  Widget build(BuildContext context) {
    return WoltScreenWidthAdaptiveWidget(
      smallScreenWidthChild: SmallScreen, 
      largeScreenWidthChild: largeScreenWidthChild)
  }

  void _onSongSelectedStatusChange(String songSelectedId, [SongMakerStep? newStep]) {
    final currentList = List<SongSelected>.from(_roomMusic.allSongs);
    final updateIndex = currentList.indexWhere((o) => o.id == songSelectedId);
    if ([SongMakerStep.album, SongMakerStep.readySong].contains(newStep)) {
      currentList[updateIndex] = currentList[updateIndex].copyWith(songMakerStep: newStep);
    } else {
      currentList.removeAt(updateIndex);
    }
    setState(() {
      _roomMusic = RoomMusic.fromSongSelected(currentList);
    });
  }

}