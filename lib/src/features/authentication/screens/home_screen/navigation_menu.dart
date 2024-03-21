import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/schemes.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() => controller.screens[controller.selectedIndex.value]),
            Positioned(
              left: 20,
              right: 20,
              bottom: 10,
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFEF1F8),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFC4C2F3),
                      blurRadius: 50,
                      offset: Offset(0, 20),
                    ),
                  ],
                ),
                child: Obx(() => NavigationBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      indicatorColor: Color(0xFFC4C2F3),
                      selectedIndex: controller.selectedIndex.value,
                      onDestinationSelected: (index) => controller.selectedIndex.value = index,
                     destinations: [
                      const NavigationDestination(icon: Icon(Iconsax.home,), label: 'Home',),
                      NavigationDestination(icon: SvgPicture.asset('assets/images/on_boarding_images/community.svg', width: 28,matchTextDirection: true,allowDrawingOutsideViewBox: true),label: 'Community'),
                      NavigationDestination(icon:ImageIcon(AssetImage('assets/images/on_boarding_images/schemes.png'),size: 24,), label: 'Schemes' ,),
                      const NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Color(0xFFFCF3F8),),
    const Schemes(),
    Container(color: Color(0xFFFCF3F8),),
  ];
}
