// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/atomic/molecules/icon/icon_large_ligth.dart';
import 'package:uikit/uikit.dart';

class ButtonNavigatorMenu extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final String firstLabel;
  final String secoundLabel;
  final String firstIcon;
  final String secoundIcon;

  const ButtonNavigatorMenu({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.firstLabel,
    required this.secoundLabel,
    required this.firstIcon,
    required this.secoundIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeToken.xl4,
      
      child: BottomNavigationBar(
        
        backgroundColor: ColorToken.danger,
        fixedColor: ColorToken.light,
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
        
              icon: currentIndex != 0
                  ? IconLargeLigth(icon: firstIcon)
                  : const SizedBox.shrink(),
              label: firstLabel),
          BottomNavigationBarItem(
              icon: currentIndex != 1
                  ? IconLargeLigth(icon: secoundIcon)
                  : const SizedBox.shrink(),
              label: secoundLabel),
        ],
      ),
    );
  }
}
