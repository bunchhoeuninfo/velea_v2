import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velea_v2/constants/velea_colors.dart';

import 'widgets/drag_scroll_behavior.dart';

void main() => runApp(VeleaApp());

class VeleaApp extends StatefulWidget {

  const VeleaApp({Key? key}) : super(key: key);

  @override
  State<VeleaApp> createState() => _VeleaAppState();

}

class _VeleaAppState extends State<VeleaApp> {

  @override
  void initState() {
    super.initState();
  
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: VeleaColors.white,
        systemNavigationBarColor: VeleaColors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: VeleaColors.blue,
        useMaterial3: true,
        fontFamily: 'Inter',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: kIsWeb || Platform.isAndroid ? 0.2 : 0.12,
          ),
        ),
        typography: Typography.material2021(platform: defaultTargetPlatform),
        scaffoldBackgroundColor: VeleaColors.white,
        indicatorColor: Colors.transparent,
        cardColor: VeleaColors.white,
        cardTheme: CardTheme(
          elevation: 2,
          color: VeleaColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            foregroundColor: VeleaColors.black,
            backgroundColor: VeleaColors.white,
            surfaceTintColor: VeleaColors.white,
            fixedSize: Size.fromHeight(36),
            padding: EdgeInsets.all(12),
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: BorderSide.none,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 56,
          surfaceTintColor: Colors.transparent,
          backgroundColor: VeleaColors.white,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: MaterialStateProperty.resolveWith <TextStyle>(
            (state) {
              return TextStyle(
                fontSize: 10,
                color: state.contains(MaterialState.selected)
                  ? VeleaColors.blue
                  : VeleaColors.black64,
              );
            },
          ),
        ),
      ),
      home: ScrollConfiguration(
        behavior: const DragScrollBehavior(), 
        child: HomeScreen(
          groupedCoffeeOrders: GroupedCoffeeOrders.fromCoffeeOrders(mockCoffeeOrders),
          isStoreOnline: true,
        ),
      ),
    );
  }
}
