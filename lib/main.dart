import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas_project/bindings/Bindings.dart';
import 'package:pas_project/menu/HomeMenu.dart';
import 'package:pas_project/pages/dashboardpage.dart';
import 'package:pas_project/pages/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/home',
          page: () => Homemenu(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: MyBindings(),
        ),
      ],
    );
  }
}
