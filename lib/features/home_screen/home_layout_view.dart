import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/create_event/create_event_screen.dart';
import 'package:evently/features/home_screen/favorite_screen.dart';
import 'package:evently/features/home_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'map_screen.dart';

class HomeLayoutView extends StatefulWidget {
  static const routeName = 'HomeLayoutView';

  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    SizedBox.shrink(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape:
              CircleBorder(side: BorderSide(width: 5, color: AppColors.white)),
          onPressed: () {
            Navigator.pushNamed(context, CreateEventScreen.routeName);
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          onTap: onBottomItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                activeIcon: Icon(Icons.map),
                label: 'Map'),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile'),
          ]),
    );
  }

  onBottomItemTapped(int index) {
    if (index == 2) {
      return;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
