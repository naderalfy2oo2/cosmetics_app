import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';

import 'cart_view.dart';
import 'cateories.dart';
import 'home.dart';
import 'profile.dart';

class NavigationHomeView extends StatefulWidget {
  const NavigationHomeView({super.key});

  @override
  State<NavigationHomeView> createState() => _NavigationHomeViewState();
}

class _NavigationHomeViewState extends State<NavigationHomeView> {
  int selectedIndex = 0;

  final List<Widget> Screens = [
    HomeView(),

    CateoriesView(),
    CartView(),

    ProfileView(),

    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Color(0xffD75D72)),
        backgroundColor: Color(0xffD9D9D9),
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },

        selectedItemColor: Color(0xffD75D72),

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: AppImage(
              image: 'hom1.png',
              color: selectedIndex == 0 ? Color(0xffD75D72) : Color(0xff8E8EA9),
            ),
          ),

          BottomNavigationBarItem(
            label: "categories",

            icon: AppImage(
              image: 'categories.png',
              color: selectedIndex == 1 ? Color(0xffD75D72) : Color(0xff8E8EA9),
            ),
          ),

          BottomNavigationBarItem(
            label: "basket",

            icon: AppImage(
              image: 'my_cart.png',
              color: selectedIndex == 2 ? Color(0xffD75D72) : Color(0xff8E8EA9),
            ),
          ),

          BottomNavigationBarItem(
            label: "profile",

            icon: AppImage(
              image: 'profile.png',
              color: selectedIndex == 3 ? Color(0xffD75D72) : Color(0xff8E8EA9),
            ),
          ),
        ],
      ),
    );
  }
}
