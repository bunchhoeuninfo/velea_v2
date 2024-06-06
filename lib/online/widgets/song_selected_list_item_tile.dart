import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velea_v2/entities/song_selected.dart';

import '../../constants/velea_colors.dart';

class SongSelectedListItemTile extends StatelessWidget {
  const SongSelectedListItemTile({
    super.key,
    required SongSelected songSelected,
    required void Function(String) onSelected,
  }) : _onSelected = onSelected,
  _songSelected = songSelected;

  final SongSelected _songSelected;
  final ValueChanged<String> _onSelected;

  VoidCallback get onTap {
    return () {
      if (kDebugMode) {
        print("Selected coffee order: ${_songSelected.id}");
      }

      _onSelected(_songSelected.id);
    };
  }

  @override
  Widget build(BuildContext context) {
    final step = _songSelected.songMakerStep;
    return SizedBox(
      height: 180,
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(step.assetName),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(color: VeleaColors.black.withOpacity(0.3)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      _SongSelectedListItemDetails(
                        songSelected: _songSelected,
                        onTap: onTap,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 56,
                        child: OutlinedButton(
                          onPressed: onTap,
                          child: Center(
                            child: Text(
                              step.actionName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SongSelectedListItemDetails extends StatelessWidget {
  const _SongSelectedListItemDetails({
    required SongSelected songSelected,
    required void Function() onTap,
  }) : _onTap = onTap,
  _songSelected = songSelected ;

  final SongSelected _songSelected;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: _onTap, 
          child: Text(
            _songSelected.id,
            style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Text(
            _songSelected.song.songName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: VeleaColors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}