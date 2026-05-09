import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_bottom_navbar.dart';
import '../../core/widgets/workout_tile.dart';

import '../../models/workout_model.dart';

class WorkoutDetailScreen
    extends StatelessWidget {

  const WorkoutDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final List<WorkoutModel> workouts = [

      WorkoutModel(
        title: "Push Up",
        reps: "3 sets • 12 reps",
      ),

      WorkoutModel(
        title: "Bench Press",
        reps: "3 sets • 10 reps",
      ),

      WorkoutModel(
        title: "Bent Over Row",
        reps: "3 sets • 12 reps",
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

              ClipRRect(

                borderRadius:
                    BorderRadius.circular(25),

                child: Image.asset(
                  "assets/images/workout.jpg",

                  height: 220,

                  width: double.infinity,

                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Upper Body Strength",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Build strength and definition in your upper body.",

                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(

                  itemCount:
                      workouts.length,

                  itemBuilder: (_, index) {

                    final workout =
                        workouts[index];

                    return WorkoutTile(
                      title: workout.title,
                      subtitle:
                          workout.reps,
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(

                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        AppColors.green,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Start Workout",

                    style: TextStyle(
                      color: Colors.black,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar:
          const CustomBottomNavbar(
        currentIndex: 2,
      ),
    );
  }
}