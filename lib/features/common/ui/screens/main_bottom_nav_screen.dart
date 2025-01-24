import 'package:ecommerce_app_review/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app_review/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
        builder: (mainBottomNavController) {
      return Scaffold(
        body: _screens[mainBottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: mainBottomNavController.selectedIndex,
          onDestinationSelected: mainBottomNavController.changeIndex,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category_outlined), label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_outline), label: 'Wish'),
          ],
        ),
      );
    });
  }
}
