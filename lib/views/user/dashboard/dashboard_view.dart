import 'package:barber/views/user/appointments/appointments_view.dart';
import 'package:barber/views/user/favourites/favourites_view.dart';
import 'package:barber/views/user/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_view.dart';

class UserDashboardView extends StatefulWidget {
  const UserDashboardView({super.key});

  @override
  State<UserDashboardView> createState() => _UserDashboardViewState();
}

class _UserDashboardViewState extends State<UserDashboardView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      //  AnimatedSwitcher(
      //   duration: const Duration(milliseconds: 500),
      //   switchInCurve: Curves.easeIn,
      //   switchOutCurve: Curves.easeOut,
      //   child: _pages[_currentIndex],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall!,
        elevation: 6.0,
        items: navbarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get navbarItems {
    return [
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.house_fill),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.calendar_today),
        label: 'Appointments',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart_fill),
        label: 'Favourites',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person_fill),
        label: 'Profile',
      ),
    ];
  }

  final List<Widget> _pages = [
    const HomeView(),
    const AppointmentsView(),
    const FavouritesView(),
    const ProfileView(),
  ];
}
