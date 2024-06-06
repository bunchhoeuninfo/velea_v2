import 'package:flutter/material.dart';
import 'package:velea_v2/core_lib/src/wolt_screen_width_adaptive_widget.dart';

import '../constants/velea_colors.dart';
import '../main.dart';

/// The `StoreOnlineStatusButton` widget displays a button indicating the online status of the store.
/// It is a toggle button that allows the user to switch the store between online and offline states.
class OnlineStatusButton extends StatelessWidget {
  const OnlineStatusButton({
    super.key,
    required ValueNotifier<bool> isStoreOnlineNotifier,
  }) : _isStoreOnlineNotifier = isStoreOnlineNotifier;

  final ValueNotifier<bool> _isStoreOnlineNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isStoreOnlineNotifier,
      builder: (__, isOnline, _) {
        return OutlinedButton(
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                side: const MaterialStatePropertyAll(BorderSide(width: 2, color: VeleaColors.gray)),
              ),
          onPressed: () {
            _isStoreOnlineNotifier.value = !_isStoreOnlineNotifier.value;
          },
          child: Row(
            children: <Widget>[
              SizedBox.square(
                  dimension: 12,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: isOnline ? VeleaColors.green : VeleaColors.red,
                    ),
                  )),
              const SizedBox(width: 8),
              WoltScreenWidthAdaptiveWidget(
                smallScreenWidthChild: const Icon(Icons.store, size: 16, color: VeleaColors.black),
                largeScreenWidthChild: Text(isOnline ? 'Online' : 'Offline'),
              ),
            ],
          ),
        );
      },
    );
  }
}
