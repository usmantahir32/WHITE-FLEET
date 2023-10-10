import 'package:flutter/material.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/asset/asset.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/profile/profile.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/home/home.dart';
import 'admin/admin.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    AssetScreen(),
    // MyEarningScreen(),
    const Center(
      child: Text("3"),
    ),
    ProfileScreen(),
    const AdminScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        selectedItemColor: AppColors.primaryClr,
        unselectedItemColor: Colors.black38,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        unselectedLabelStyle:
            TextStyle(fontSize: SizeConfig.textMultiplier * 1.5),
        selectedLabelStyle:
            TextStyle(fontSize: SizeConfig.textMultiplier * 1.6),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.home,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                    currentIndex == 0 ? AppColors.primaryClr : Colors.black38),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.assets,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                    currentIndex == 1 ? AppColors.primaryClr : Colors.black38),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.gift,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                    currentIndex == 2 ? AppColors.primaryClr : Colors.black38),
            label: 'Benefits',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.profile,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                    currentIndex == 3 ? AppColors.primaryClr : Colors.black38),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.admin,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                    currentIndex == 4 ? AppColors.primaryClr : Colors.black38),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
