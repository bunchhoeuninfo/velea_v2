import 'package:flutter/material.dart';
import 'package:velea_v2/core_lib/wolt_responsive_layout_grid.dart';
import 'package:velea_v2/entities/song_maker_step.dart';

class EmptySongSelectedListWidget extends StatelessWidget {

  const EmptySongSelectedListWidget({
    super.key,
    required this.songMakerStep,
  });

  final SongMakerStep songMakerStep;

  @override
  Widget build(BuildContext context) {
    return WoltScreenWidthAdaptiveWidget(
      largeScreenWidthChild: const SizedBox.shrink(), 
      smallScreenWidthChild: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              songMakerStep.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'New tasks will appear here automatically',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}

extension _CoffeeMakerStepExtension on SongMakerStep {
  String get title {
    switch (this) {
      case SongMakerStep.album:
        return 'No need to grind';
      case SongMakerStep.addSong:
        return 'No need to addWater';
      case SongMakerStep.readySong:
        return 'Nothing ready yet';
    }
  }
}