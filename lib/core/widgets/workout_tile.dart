import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class WorkoutTile extends StatelessWidget {

  final String title;
  final String subtitle;

  const WorkoutTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin:
          const EdgeInsets.only(bottom: 16),

      padding:
          const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.card,

        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            backgroundColor:
                AppColors.green,

            child: Icon(
              Icons.fitness_center,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Text(
                  subtitle,

                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,

            color: Colors.white54,
            size: 16,
          )
        ],
      ),
    );
  }
}