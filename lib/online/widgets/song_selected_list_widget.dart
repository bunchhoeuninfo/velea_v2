import 'package:flutter/material.dart';
import 'package:velea_v2/entities/song_maker_step.dart';
import 'package:velea_v2/online/widgets/empty_song_selected_list_widget.dart';
import 'package:velea_v2/online/widgets/song_selected_list_item_tile.dart';

import '../../entities/song_selected.dart';

class SongSelectedListWidget extends StatelessWidget {


  

  const SongSelectedListWidget({
    required this.songSelected,
    required SongMakerStep songMakerStep,
    required void Function(String) onSongSelected,
    super.key      
  }) : _onSongSelected = onSongSelected,
  _songMakerStep = songMakerStep;

  final List<SongSelected> songSelected;
  final SongMakerStep _songMakerStep;
  final ValueChanged<String> _onSongSelected;
  
  @override
  Widget build(BuildContext context) {
    return songSelected.isEmpty
      ? EmptySongSelectedListWidget(songMakerStep: _songMakerStep)
      : ListView.separated(
        itemBuilder: (_, index) {
          final songSelect = songSelected[index];
          return Column(
            children: [
              if (index == 0) const SizedBox(height: 16,),
              SongSelectedListItemTile(
                songSelected: songSelect, 
                onSelected: _onSongSelected,
              ),
              if (index == songSelected.length - 1)
                const SizedBox(height: 16,),
            ],
          );
        }, 
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: songSelected.length,
      );
  }
}