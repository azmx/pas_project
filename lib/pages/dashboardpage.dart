import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_project/controller/dashboardcontroller.dart';
import 'package:pas_project/menu/FavoriteMenu.dart';
import 'package:pas_project/menu/HomeMenu.dart';
import 'package:pas_project/menu/ProfileMenu.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Dashboardcontroller dashboardController = Get.put(Dashboardcontroller());

    
    final List<Widget> menus = [
      Homemenu(),
      FavoriteMenu(),
      ProfileMenu(),
    ];

   return Obx(() {
  return Scaffold(
    body: menus[dashboardController.selectedIndex.value],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: dashboardController.selectedIndex.value,
      onTap: (index) {
        dashboardController.selectedIndex.value = index;
      },
      backgroundColor: Colors.black, 
      selectedItemColor: Color.fromARGB(255, 174, 5, 5), 
      unselectedItemColor: const Color.fromARGB(255, 255, 121, 59), 
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile", 
        ),
      ],
    ),
  );
});

  }
}