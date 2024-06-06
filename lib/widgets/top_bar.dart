
import 'package:flutter/material.dart';
import 'package:velea_v2/entities/song_maker_step.dart';
import 'package:velea_v2/extensions/build_context_extension.dart';

import '../core_lib/wolt_responsive_layout_grid.dart';
import 'online_status_button.dart';
import 'song_maker_customer_divider.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key,
  required ValueNotifier<bool> isStoreOnlineNotifier,
  SongMakerStep? selectedStepForBottomNavigationBar,
  }) : _isStoreOnlineNotifier = isStoreOnlineNotifier,
  _selectedStepForBottomNavigationBar = selectedStepForBottomNavigationBar ;

  final SongMakerStep? _selectedStepForBottomNavigationBar;
  final ValueNotifier<bool> _isStoreOnlineNotifier;
  
  @override
  Widget build(BuildContext context) {

    const store = 'Music Room';
    final selectedStep = _selectedStepForBottomNavigationBar;
    late String title;

    switch (context.screenSize) {
      case WoltScreenSize.small:
        title =
            _isStoreOnlineNotifier.value && selectedStep != null ? selectedStep.stepName : store;
        break;
      case WoltScreenSize.large:
        title = store;
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              OnlineStatusButton(isStoreOnlineNotifier: _isStoreOnlineNotifier),
            ],
          ),
        ),
        const SongMakerCustomerDivider(),
      ],
    );
  }

}