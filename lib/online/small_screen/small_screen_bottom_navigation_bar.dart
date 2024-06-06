import 'package:flutter/material.dart';
import 'package:velea_v2/entities/room_music.dart';
import 'package:velea_v2/entities/song_maker_step.dart';
import 'package:velea_v2/widgets/song_maker_customer_divider.dart';

import '../../constants/velea_colors.dart';


typedef OnSongMakerStepSelected = void Function(SongMakerStep selectedStep);

class SmallScreenBottomNavigationBar extends StatelessWidget {
  const SmallScreenBottomNavigationBar({
    required SongMakerStep selectedStep,
    required void Function(SongMakerStep) onSelected,
    required RoomMusic roomMusic,
    super.key, 
  }) : _roomMusic = roomMusic, _onSelected = onSelected, _selectedStep = selectedStep ;

  final SongMakerStep _selectedStep;
  final OnSongMakerStepSelected _onSelected;
  final RoomMusic _roomMusic;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        const SongMakerCustomerDivider(),
        NavigationBar(
          destinations: [
            for (SongMakerStep step in SongMakerStep.values)
              step._navigationDestination(
                isSelected: step == _selectedStep, 
                count: _roomMusic.countForStep(step)),
          ],
          selectedIndex: _selectedStep.index,
          onDestinationSelected: (i) {
            _onSelected(SongMakerStep.values.firstWhere((element) => element.stepNumber == i));
          },
        ),
      ],
    );
  }
}

/// Represents data for a navigation destination.
class NavigationDestinationData {
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  const NavigationDestinationData({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

extension SongMakerStepExtension on SongMakerStep {
  NavigationDestination _navigationDestination({
    required bool isSelected,
    required int count,
  }) {
    switch (this) {
      case SongMakerStep.album:
        return NavigationDestination(
          icon: _DestinationIcon(
            Icons.add_circle_outline_outlined, 
            isSelected: isSelected, 
            count: count
          ), 
          selectedIcon: _DestinationIcon(
            Icons.add_circle_rounded,
            isSelected: isSelected,
            count: count,
          ),
          label: stepName,
        );
      case SongMakerStep.addSong:
        return NavigationDestination(
          icon: _DestinationIcon(
            Icons.water_drop_outlined, 
            isSelected: isSelected, 
            count: count
          ),
          selectedIcon: _DestinationIcon(
            Icons.water_drop_rounded, 
            isSelected: isSelected, 
            count: count
          ), 
          label: stepName,
        );
      case SongMakerStep.readySong:
        return NavigationDestination(
          icon: _DestinationIcon(
            Icons.coffee,
            isSelected: isSelected,
            count: count,
          ),
          selectedIcon: _DestinationIcon(
            Icons.coffee_rounded,
            isSelected: isSelected,
            count: count,
          ),
          label: stepName,
        );
    }
  }
}

/// A widget representing an icon for a navigation destination.
class _DestinationIcon extends StatelessWidget {
  const _DestinationIcon(
    this.iconData, {
    required this.isSelected,
    required this.count,
  });

  final IconData iconData;
  final bool isSelected;
  final int count;

  @override
  Widget build(BuildContext context) {
    final icon = Icon(iconData, color: isSelected ? VeleaColors.blue : VeleaColors.black64);
    return count == 0
        ? icon
        : Badge(
            backgroundColor: VeleaColors.red,
            label: Text(count.toString()),
            child: icon,
          );
  }
}