import 'package:flutter/material.dart';
import 'package:velea_v2/entities/room_music.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required RoomMusic roomMusic,
    required bool isStoreOnline,
  })  : _roomMusic = roomMusic,
        _isStoreOnline = isStoreOnline;

  final RoomMusic _roomMusic;
  final bool _isStoreOnline;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<bool> _isStoreOnlineNotifier;

  @override
  void initState() {
    super.initState();
    _isStoreOnlineNotifier = ValueNotifier(widget._isStoreOnline);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isStoreOnlineNotifier,
      builder: (_, bool isStoreOnline, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isStoreOnline
              ? StoreOnlineContent(
                  groupedCoffeeOrders: widget._groupedCoffeeOrders,
                  isStoreOnlineNotifier: _isStoreOnlineNotifier,
                )
              : StoreOfflineContent(isStoreOnlineNotifier: _isStoreOnlineNotifier),
        );
      },
    );
  }
}
