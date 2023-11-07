import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);
// bottom_bar.dart



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 7,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: Container(
              //alignment: Alignment.center,
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/grid.svg",
              ),
            ),
            activeIcon: Container(
              //alignment: Alignment.center,
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/grid_active.svg",
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/shopping-cart.svg",
              ),
            ),
            activeIcon: Container(
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/shopping-cart_active.svg",
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/user.svg",
              ),
            ),
            activeIcon: Container(
              padding: EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/images/user_active.svg",
              ),
            ),
            label: ''),
      ],
    );
  }
}
