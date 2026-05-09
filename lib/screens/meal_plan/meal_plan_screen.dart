import 'package:flutter/material.dart';

import '../../core/widgets/custom_bottom_navbar.dart';
import '../../core/widgets/meal_card.dart';

import '../../models/meal_model.dart';

class MealPlanScreen extends StatelessWidget {

  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<MealModel> meals = [

      MealModel(
        title: "Breakfast",
        subtitle: "Oatmeal Bowl",
        calories: "520 kcal",
      ),

      MealModel(
        title: "Lunch",
        subtitle: "Grilled Chicken",
        calories: "650 kcal",
      ),

      MealModel(
        title: "Dinner",
        subtitle: "Salmon Salad",
        calories: "580 kcal",
      ),
    ];

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const Text(
                "Meal Plan",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(

                  itemCount: meals.length,

                  itemBuilder: (_, index) {

                    final meal = meals[index];

                    return MealCard(
                      title: meal.title,
                      subtitle: meal.subtitle,
                      calories: meal.calories,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar:
          const CustomBottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}