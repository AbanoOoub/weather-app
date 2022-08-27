import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/data/models/app_colors.dart';
import 'package:weather_app/presentation/screens/locations_screen.dart';
import 'package:weather_app/presentation/screens/profile_screen.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

import '../../data/constants/countries.dart';
import '../../data/constants/strings.dart';
import '../../data/helpers/shared_prefs.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  List<Widget> screens = [
    const WeatherScreen(),
    const LocationsScreen(),
    const ProfileScreen(),
  ];
  List<String> appBarTitles = [
    'Weather Application',
    'Add Countries',
    'Profile',
  ];

  @override
  void initState() {
    CacheHelper.saveDataList(
        key: allCountriesKey, valList: countries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 2,
        title: Center(
          child: Text(appBarTitles[screenIndex],style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.secondColor,
          ),),
        ),

      ),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenIndex,
          selectedFontSize: 14.sp,
          selectedIconTheme:
              const IconThemeData(color: AppColors.secondColor, size: 25),
          selectedItemColor: AppColors.secondColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          unselectedIconTheme: const IconThemeData(color: AppColors.mainColor),
          unselectedLabelStyle: const TextStyle(color: AppColors.mainColor),
          onTap: (int index) {
            setState(() {
              screenIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny_outlined), label: 'Weather'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: 'Countries'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]),
    );
  }
}
