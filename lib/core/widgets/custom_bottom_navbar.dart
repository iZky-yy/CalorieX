import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/meal_plan/meal_plan_screen.dart';
import '../../screens/workout/workout_detail_screen.dart';
import '../../screens/profile/profile_page.dart';

import '../constants/app_colors.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
  });

  void onTabTapped(BuildContext context, int index) {

    // supaya tidak reload halaman yang sama
    if (index == currentIndex) return;

    Widget page;

    switch (index) {
      case 0:
        page = const HomeScreen();
        break;

      case 1:
        page = const MealPlanScreen();
        break;

      case 2:
        page = const WorkoutDetailScreen();
        break;

      case 3:
        page = const ProfilePage();
        break;

      default:
        page = const HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [

          navItem(
            context,
            Icons.home,
            0,
          ),

          navItem(
            context,
            Icons.calendar_today,
            1,
          ),

          navItem(
            context,
            Icons.fitness_center,
            2,
          ),

          navItem(
            context,
            Icons.person,
            3,
          ),
        ],
      ),
    );
  }

  Widget navItem(
    BuildContext context,
    IconData icon,
    int index,
  ) {
    final bool isActive =
        currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTabTapped(context, index);
      },

      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 200),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: isActive
              ? AppColors.green
                  .withOpacity(0.15)
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(16),
        ),

        child: Icon(
          icon,
          color: isActive
              ? AppColors.green
              : Colors.white54,
        ),
      ),
    );
  }
}