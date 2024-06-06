import 'package:flutter/material.dart';
import 'package:velea_v2/entities/room_music.dart';
import 'package:velea_v2/entities/song_maker_step.dart';
import 'package:velea_v2/online/widgets/song_selected_list_widget.dart';
import 'package:velea_v2/widgets/top_bar.dart';

import '../../constants/velea_colors.dart';
import 'small_screen_bottom_navigation_bar.dart';

class SmallScreenOnlineContent extends StatefulWidget {
  const SmallScreenOnlineContent({
    required Map<SongMakerStep, SongSelectedListWidget> songSelectedListWidget,
    required ValueNotifier<bool> isStoreOnlineNotifier,
    required RoomMusic roomMusic,
    super.key,
  })  : _roomMusic = roomMusic,
        _songSelectedListWidget = songSelectedListWidget,
        _isStoreOnlineNotifier = isStoreOnlineNotifier;

  final ValueNotifier<bool> _isStoreOnlineNotifier;
  final Map<SongMakerStep, SongSelectedListWidget> _songSelectedListWidget;
  final RoomMusic _roomMusic;

  @override
  State<SmallScreenOnlineContent> createState() => _SmallScreenOnlineContentState();
}

class _SmallScreenOnlineContentState extends State<SmallScreenOnlineContent> {
  SongMakerStep _songMakerStepForBottomNavigationBar = SongMakerStep.album;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(selectedStepForBottomNavigationBar: _songMakerStepForBottomNavigationBar,
            isStoreOnlineNotifier: widget._isStoreOnlineNotifier),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: VeleaColors.black4,
                child: widget._songSelectedListWidget[_songMakerStepForBottomNavigationBar]!,
              ),
            ),
          ],
          
        ),
      ),
      bottomNavigationBar: SmallScreenBottomNavigationBar(
        roomMusic: widget._roomMusic,
        selectedStep: _songMakerStepForBottomNavigationBar,
        onSelected: (selectedStep) {
          setState(() {
            _songMakerStepForBottomNavigationBar = selectedStep;
          });
        },
      ),
    );
  }


}
