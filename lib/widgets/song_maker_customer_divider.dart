import 'package:flutter/material.dart';
import 'package:velea_v2/constants/velea_colors.dart';

class SongMakerCustomerDivider extends StatelessWidget {

  const SongMakerCustomerDivider({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: VeleaColors.gray,
      child: SizedBox(
        height: 1,
        width: double.infinity,
      ),
    );
  }


}